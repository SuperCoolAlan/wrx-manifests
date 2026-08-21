#!/usr/bin/env python3
"""Splice the WRX build manual from the source FSM PDFs, per manual/print-index.md.

One PDF per binder tab. Each gets a generated cover page listing contents and
source year, then the sections, bookmarked. Sections are padded to even page
counts so every section starts on a right-hand page when duplexed.
"""
import os, io, sys, json
from io import BytesIO
import pypdf
from pypdf import PdfWriter, PdfReader
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch


# ── TRAPS — single source of truth. Tagged by tab; the TOC imports this. ──────
# Each entry: (tabs it applies to, text)
TRAPS = [
 ((2,),   "USE THE 2005 STi SECTION. It covers this EJ257 short block AND its heads,"),
 ((2,),   "   and it is what the engine was actually assembled to."),
 ((2,),   "KEEP THE 2007 H4DOTC SECTION - it is not a duplicate. It is the COMBINED"),
 ((2,),   "   WRX/STi manual and documents 6 fasteners the 2005 STi section omits"),
 ((2,),   "   (con rod bolts 52 N.m, oil pump relief plug 44 N.m, tensioner bracket"),
 ((2,),   "   24.5 N.m, V-belt cover, A/C hoses). It also branches STi vs Except-STi"),
 ((2,),   "   in 5 places - e.g. CRANKSHAFT STOPPER is 75 N.m STi, 72 N.m otherwise."),
 ((2,),   "   TAKE THE STi FIGURE. Where the two sections overlap they AGREE; any"),
 ((2,),   "   ft-lb mismatch is rounding of the same N.m value."),
 ((2,),   "THIS ENGINE IS SINGLE AVCS - intake only, one solenoid per head. So are"),
 ((2,),   "   the 2005 STi and 2007 H4DOTC sections printed here, so they match."),
 ((2,),   "   Dual AVCS arrived on the 2008 STi - do NOT use a 2008+ manual here."),
 ((3,),   "WHY IS H4SO HERE? Subaru filed ONE starting/charging system for the whole"),
 ((3,),   "   engine range in the H4SO file - it contains sections for NON-TURBO,"),
 ((3,),   "   TURBO and STi MODEL. SC(STi) and SC(H4DOTC) are 2-page pointers to it."),
 ((3,),   "   SC(H4SO) is the only file that actually contains this car's data."),
 ((3,),   "CO / EX / SC under (STi) are ALL stubs pointing at H4DOTC or H4SO."),
 ((3,),   "Charging specs superseded: Singer 200A/220A, 14.8V reg, not the 90A OEM."),
 ((3,),   "EX is REFERENCE ONLY - exhaust is aftermarket end to end, catless."),
 ((3,),   "BOOST CONTROL IS FULLY SUPERSEDED. External TiAL MVS 38mm wastegate on a"),
 ((3,),   "   PLM EWG uppipe, run by a 3-port solenoid. All factory 2-port EBCS and"),
 ((3,),   "   internal-wastegate content is VOID. The WASTEGATE SPRING sets the"),
 ((3,),   "   MINIMUM boost - no tune can go below it. Check which spring is fitted."),
 ((4,),   "DCCD: the FACTORY KNOB AND CLUSTER DISPLAY WORK. A DCCDPro controller sits"),
 ((4,),   "   behind them adding automatic G-sensor modes. CS Control Systems describes the"),
 ((4,),   "   factory control electronics - superseded. Its centre diff content still applies."),
 ((4,),   "Unit is a 2011 6MT. The 2011 manual has no bookmarks, so 2007 files serve"),
 ((4,),   "   as the readable proxy - same DCCD 6MT family. Verify torques against 2011."),
 ((4,),   "Clutch release stack is 6MT THROUGHOUT: 6MT flywheel, ACT Stage 2 clutch,"),
 ((4,),   "   2011 6MT fork, ACT-supplied bearing. The 2004 pedal, master cylinder,"),
 ((4,),   "   hard pipe and SLAVE carry over and work. Do not mix WRX and STi parts"),
 ((4,),   "   across this stack - that is what causes a clutch that will not release."),
 ((4,),   "MUCH OF THE 2004 CHASSIS CARRIED OVER: the 2011 6MT sits in the 2004"),
 ((4,),   "   CROSSMEMBER on a 6MT mount, worked by the 2004 SHIFTER and 2004 CLUTCH"),
 ((4,),   "   LINE. Do not order STi parts for these - measure against the 2004 book."),
 ((6,),   "Suspension LINK fasteners use the Wagon / Except-STi torque: 30 N.m, NOT 45."),
 ((6,),   "STi knuckles on WAGON links and WAGON sway bars - you straddle both branches."),
 ((6,),   "BC coilovers supersede all OEM strut and spring service pages -"),
 ((6,),   "   whichever BC application they are. That is a fitment question, not a"),
 ((6,),   "   manual question."),
 ((6,),   "Steering rack is the ORIGINAL 2004 unit - use the 2004 pages for it."),
 ((6,),   "Wheel & Tire comes from 2007 because this car is 5x114.3. The 2004 wheel"),
 ((6,),   "   pages describe 5x100 and DO NOT APPLY."),
 ((6,),   "THREE YEARS HERE, each doing a different job: 2004 = WAGON chassis side"),
 ((6,),   "   (subframe, link mounting, wagon torques). 2007/2005 = STi knuckle,"),
 ((6,),   "   hub and bearing procedures."),
 ((7,),   "TAB 7a AS-WIRED PRINTS IN FRONT OF THESE DIAGRAMS AND SUPERSEDES THEM."),
 ((7,),   "   Handwritten Link ECU pin notes are filed here too and OUTRANK any"),
 ((7,),   "   printed pinout, including this binder's."),
 ((7,),   "These diagrams do NOT describe this car - 2005 STi engine harness was"),
 ((7,),   "   merged to the 2004 GG body harness by iWire."),
 ((7,),   "All OEM ECU / OBD-II / immobilizer content is VOID - car runs a Link WRX104X."),
 ((7,),   "AT LEAST ONE ECU PIN HAS BEEN SWAPPED. The rear O2 signal pin was moved so"),
 ((7,),   "   the Link could use both ends. THE CONNECTOR LOOKS FACTORY - nothing on"),
 ((7,),   "   the car shows this. The HANDWRITTEN LINK NOTES filed in this binder are"),
 ((7,),   "   the ONLY record. Do not assume any ECU pin matches the factory diagram."),
 ((7,),   "THERE IS NO REAR O2 SENSOR. Its connector B19 (4-pin grey) NOW CARRIES THE"),
 ((7,),   "   FLEX FUEL SENSOR, via an iWire adapter to the Continental plug. An O2"),
 ((7,),   "   sensor will still PHYSICALLY PLUG IN there - do not fit one. The Link"),
 ((7,),   "   reads a frequency on that circuit, not an O2 voltage."),
 ((7,),   "CRUISE CONTROL IS NOT FITTED - deliberately left unwired at harness build."),
 ((7,),   "   It is not broken. Do not diagnose it. SP Speed Control is VOID."),
 ((7,),   "Knock sensor: 24 N.m, and the cord must exit at 60 degrees to engine rear."),
 ((7,),   "FUEL PUMP IS HARDWIRED THROUGH A 40A RELAY UNDER THE REAR SEAT."),
 ((7,),   "   The factory control module (R122) is UNPLUGGED and out of the circuit."),
 ((7,),   "   The BY wire between R57 and R58 IS CUT: R58 pin 1 now takes its high"),
 ((7,),   "   current straight from the relay. The factory feed shown on WI-82 as BOr"),
 ((7,),   "   at R15 pin 8 -> BY across R57 -> R58 pin 1 CARRIES NOTHING. Tracing that"),
 ((7,),   "   circuit against the manual will mislead you. See TAB 7a."),
 ((7,),   "Fuel pump control chain is cut in TWO places, both under the rear seat:"),
 ((7,),   "   1. BY from the fuel pump relay, between R1 pin 7 and R122 pin 10 - now"),
 ((7,),   "      drives the new relay coil. R122 past the cut is dead."),
 ((7,),   "   2. BY between R57 and R58 - R58 pin 1 now takes relay high current."),
 ((7,),   "   3. B (ground) between R57 and R58 - tapped to CHASSIS under the seat."),
 ((7,),   "      The factory ground running forward via R57/R15 pin 16 to GND-04 is"),
 ((7,),   "      no longer the pump's return path."),
 ((7,),   "   ECM connector D pin 15 (GR) still commands the factory fuel pump relay"),
 ((7,),   "   and that part of the circuit is INTACT - it is what switches the new relay."),
 ((7,),   "FUEL PUMP CONTROL IS BODY-SIDE WIRING, AND THE BODY HARNESS IS 2004 WRX."),
 ((7,),   "   Use E/G(TB)-01 (WI-82, turbo). The STi diagram E/G(ST)-01 (WI-108) adds"),
 ((7,),   "   an R166/R167 pair between R1 and R122. THIS CAR DOES NOT HAVE THAT PAIR -"),
 ((7,),   "   it is STi-CAR-only, not STi-engine. Confirmed absent on this vehicle."),
 ((1,),   "Recommended Materials + Periodic Maintenance are REFERENCE ONLY."),
 ((1,),   "   All fluids are re-specced; PM is rewritten for track use."),
 ((5,),   "Rotors are KNS gravel-spec aftermarket: KNS4651 front / KNS4656 rear."),
 ((5,),   "Rear rotor carries the R180 STi parking brake drum - see PB section."),
 ((5,),   "PARKING BRAKE CABLES ARE THE ORIGINAL 2004 CHASSIS CABLES and are verified"),
 ((5,),   "   holding on these discs, despite the 05-07 STi rear knuckles. BOTH the"),
 ((5,),   "   2004 and 2007 PB sections are printed - USE THE 2004 ONE for cable"),
 ((5,),   "   routing and adjustment. 2007 is a cross-check for the STi-era discs."),
 ((5,),   "Pads are Hawk Performance - compound is printed on the backing plate."),
 ((8,),   "Wagon-specific. Sedan pages will mislead."),
]
def traps_for(tab): return [t for tabs,t in TRAPS if tab in tabs]

# FSM sources are large and gitignored; point WRX_FSM_SRC at wherever they live.
SRC = os.environ.get("WRX_FSM_SRC") or os.path.expanduser("~/Downloads")
OUT = "/Users/alan/Documents/WRX/manual/print"
Y4 = "2004 Service Manual/"
Y5 = "2005 Service Manual/"
Y7 = "2007 Service Manual/"

TABS = [
 (1,"FRONT MATTER","Most-used pages. Consider heavy stock.",
  [],
  [("Identification (VIN/chassis)","2004",Y4+"General Information/ID Identification.pdf"),
   ("Notes & symbols","2004",Y4+"General Information/NT Note.pdf"),
   ("Precautions","2004",Y4+"General Information/PC Precaution.pdf"),
   ("Specifications — WRX baseline","2004",Y4+"General Information/SPC Specs.pdf"),
   ("Specifications — STi figures","2005",Y5+"General Information/SPC Specs.pdf"),
   ("Recommended Materials (fluids) — ref only","2004",Y4+"General Information/RM Recommended Mat.pdf"),
   ("Periodic Maintenance — ref only","2004",Y4+"General Information/PM Periodic Maint.pdf")]),
 (2,"ENGINE","2005 STi EJ257 governs. The H4DOTC section is a cross-check.",
  [],
  [("Mechanical — WHOLE ENGINE, THE ONE TO USE","2005 STi EJ257",Y5+"STi Engine/ME(STi) 04 Mechanical.pdf"),
   ("Mechanical — extra fastener specs + STi callouts","2007 H4DOTC",Y7+"H4DOTC Engine/ME(H4DOTC) Mechanical.pdf"),
   ("General Description","2005 STi",Y5+"STi Engine/GD(STi) 12 General Desc.pdf"),
   ("Lubrication","2005 STi",Y5+"STi Engine/LU(STi) 07 Lubrication.pdf"),
   ("Intake","2005 STi",Y5+"STi Engine/IN(STi) 03 Intake.pdf"),
   ("Ignition","2005 STi",Y5+"STi Engine/IG(STi) 09 Ignition.pdf"),
   ("Fuel Injection (reference)","2005 STi",Y5+"STi Engine/FU(STi) Fuel Injection.pdf"),
   ("Emission Control","2005 STi",Y5+"STi Engine/EC(STi) 02 Emission Control.pdf")]),
 (3,"COOLING / EXHAUST / CHARGING","The STi versions of these are 1-page stubs.",
  [],
  [("Cooling","2005 H4DOTC",Y5+"H4DOTC Engine/CO(H4DOTC) Cooling.pdf"),
   ("Exhaust — reference only","2005 H4DOTC",Y5+"H4DOTC Engine/EX(H4DOTC) Exhaust.pdf"),
   ("Starting / Charging","2005 H4SO",Y5+"H4SO Engine/SC(H4SO) Starting-Charging.pdf")]),
 (4,"DRIVETRAIN — 6MT + DCCD","2007 modular PDFs as the readable proxy.",
  [],
  [("6MT Transmission & Differential","2007",Y7+"Transmission/6MT Manual Trans & Diff.pdf"),
   ("Control Systems — DCCD (mech. only)","2007",Y7+"Transmission/CS Control Systems.pdf"),
   ("Clutch — 6MT side","2007",Y7+"Transmission/CL Clutch System.pdf"),
   ("Clutch — 2004 actuation specs","2004",Y4+"Transmission/CL Clutch System.pdf"),
   ("Differentials (R180)","2007",Y7+"Chassis/DI Differentials.pdf"),
   ("Drive Shaft / axles","2007",Y7+"Chassis/DS Drive Shaft.pdf")]),
 (5,"BRAKES","Calipers are 06-07 WRX, so the 2007 manual governs.",
  [],
  [("Brakes","2007",Y7+"Chassis/BR Brake.pdf"),
   ("Parking Brake — THE ONE TO USE, cables are 2004","2004",Y4+"Chassis/PB Parking Brake.pdf"),
   ("Parking Brake — cross-check, STi-era rear discs","2007",Y7+"Chassis/PB Parking Brake.pdf"),
   ("ABS","2007",Y7+"Chassis/ABS.pdf")]),
 (6,"SUSPENSION / CHASSIS","* MIXED: STi knuckles on wagon links.",
  [],
  [("Front Susp — STi knuckle/hub","2007",Y7+"Chassis/FS Front Suspension.pdf"),
   ("Front Susp — cross-ref","2005",Y5+"Chassis/FS Front Suspension.pdf"),
   ("Front Susp — WAGON chassis side","2004 GG",Y4+"Chassis/FS Front Suspension.pdf"),
   ("Rear Susp — STi knuckle/hub","2007",Y7+"Chassis/RS Rear Suspension.pdf"),
   ("Rear Susp — cross-ref","2005",Y5+"Chassis/RS Rear Suspension.pdf"),
   ("Rear Susp — WAGON chassis side","2004 GG",Y4+"Chassis/RS Rear Suspension.pdf"),
   ("Power Steering","2004",Y4+"Chassis/PS Power Assisted System (Power Steering).pdf"),
   ("Wheel & Tire — 2007 because 5x114.3","2007",Y7+"Chassis/WT Wheel & Tire .pdf")]),
 (7,"ELECTRICAL / WIRING","Merge is done. For future troubleshooting, not install.",
  [],
  [("Body harness — 2004 GG","2004",Y4+"Wiring/WI Wiring Sys.pdf"),
   ("Engine harness — 2005 STi","2005",Y5+"Wiring/WI Wiring Sys.pdf"),
   ("Instrument cluster — 07 STi","2007",Y7+"Body/IDI Instrument-Driver Info.pdf"),
   ("Lighting","2004",Y4+"Body/LI Lighting Sys.pdf")]),
 (8,"BODY / INTERIOR — wagon","Trim removal is the genuinely useful part.",
  [],
  [("Exterior / Interior Trim","2004",Y4+"Body/EI Ext Int Trim.pdf"),
   ("Body Structure","2004",Y4+"Body/BS Body Structure.pdf"),
   ("Glass / Windows / Mirrors","2004",Y4+"Body/GW Glass-Win-Mir.pdf")]),
]

def cover(tabno, title, subtitle, warnings, items, counts, starts):
    buf = io.BytesIO()
    c = canvas.Canvas(buf, pagesize=letter)
    W,H = letter
    m = 0.9*inch
    c.setFillColorRGB(.10,.11,.13); c.rect(0,H-2.5*inch,W,2.5*inch,fill=1,stroke=0)
    c.setFillColorRGB(1,1,1)
    c.setFont("Helvetica-Bold",64); c.drawString(m,H-1.75*inch,str(tabno))
    c.setFont("Helvetica-Bold",21); c.drawString(m+1.15*inch,H-1.55*inch,title)
    c.setFont("Helvetica",10.5); c.setFillColorRGB(.75,.76,.78)
    c.drawString(m+1.17*inch,H-1.85*inch,subtitle)
    y = H-3.0*inch
    c.setFillColorRGB(.10,.11,.13); c.setFont("Helvetica-Bold",8.5)
    c.drawString(m,y,"CONTENTS")
    c.drawRightString(W-m-0.62*inch,y,"SOURCE YEAR")
    c.drawRightString(W-m,y,"START PAGE"); y-=4
    c.setStrokeColorRGB(.80,.80,.82); c.setLineWidth(.6); c.line(m,y,W-m,y); y-=20
    for ((label,src,_),n,st) in zip(items,counts,starts):
        c.setFillColorRGB(.10,.11,.13); c.setFont("Helvetica",11); c.drawString(m,y,label)
        c.setFillColorRGB(.42,.43,.46); c.setFont("Helvetica",9)
        c.drawRightString(W-m-0.62*inch,y,src)
        c.setFillColorRGB(.10,.11,.13); c.setFont("Helvetica",10)
        c.setFillColorRGB(.10,.11,.13); c.setFont("Helvetica-Bold",9)
        c.drawRightString(W-m,y,f"{tabno}-{st}")

        y-=19
    y-=10
    c.setStrokeColorRGB(.80,.80,.82); c.line(m,y,W-m,y); y-=16
    c.setFont("Helvetica-Bold",10); c.setFillColorRGB(.10,.11,.13)
    c.drawRightString(W-m,y,f"{sum(counts)} pages"); y-=30
    if warnings:
        c.setFillColorRGB(.99,.96,.90); c.rect(m-10,y-len(warnings)*13-14,W-2*m+20,len(warnings)*13+22,fill=1,stroke=0)
        c.setFillColorRGB(.55,.33,.05); c.setFont("Helvetica-Bold",8.5)
        c.drawString(m,y,"BEFORE YOU USE THIS SECTION"); y-=15
        c.setFont("Helvetica",9); c.setFillColorRGB(.25,.20,.12)
        for w in warnings: c.drawString(m,y,w); y-=13
    c.setFont("Helvetica",7.5); c.setFillColorRGB(.55,.56,.58)
    c.drawString(m,0.65*inch,"2004 WRX wagon · V25B STi Cosworth heads on 2005-era EJ257 · FP Red · E85 · Link WRX104X · 2011 6MT/DCCD · 05-07 STi knuckles")
    c.drawString(m,0.5*inch,"Assembled from 2004 / 2005 / 2007 Subaru FSMs. Section sources are per-row above — they are NOT all the same year.")
    c.showPage(); c.save(); buf.seek(0)
    return PdfReader(buf)

def stamp(writer, tabno, title, spans):
    """Foot every page with tab, section, SOURCE YEAR and a printed page number.

    The source year is the point: without it, sections from three different
    manuals look identical once the binder is open.
    """
    owner={}
    for sp in spans:
        for k in range(sp["pages"]): owner[sp["start"]+k-1]=sp
    buf=BytesIO(); cs=canvas.Canvas(buf)
    for i,page in enumerate(writer.pages):
        mb=page.mediabox
        x0,y0=float(mb.left),float(mb.bottom)
        pw,ph=float(mb.width),float(mb.height)
        rot=(page.get("/Rotate") or 0)%360
        cs.setPageSize((pw,ph) if rot in (0,180) else (ph,pw))
        cs.saveState()
        if rot: cs.translate(pw if rot==180 else 0, ph if rot in (90,180) else 0); cs.rotate(-rot)
        sp=owner.get(i)
        cs.setFillColorRGB(.99,.99,.99); cs.rect(0,0,pw,17,fill=1,stroke=0)
        cs.setFillColorRGB(.42,.43,.46); cs.setFont("Helvetica",6.6)
        cs.drawString(16,6,f"TAB {tabno}  {title}")
        if sp:
            cs.setFillColorRGB(.55,.33,.05); cs.setFont("Helvetica-Bold",6.6)
            cs.drawCentredString(pw/2,6,f'{sp["label"]}   ·   SOURCE: {sp["source"]}')
        cs.setFillColorRGB(.20,.21,.24); cs.setFont("Helvetica-Bold",7.4)
        cs.drawRightString(pw-16,6,f"{tabno}-{i+1}")
        cs.restoreState(); cs.showPage()
    cs.save(); buf.seek(0)
    ov=PdfReader(buf)
    for i,page in enumerate(writer.pages):
        try: page.merge_page(ov.pages[i])
        except Exception as e: print(f"  !! stamp failed on page {i+1}: {e}")


def strip_links(writer):
    """Remove every link annotation. Merging re-paginates the source FSMs, so
    their internal cross-reference links point at the wrong pages - and none
    of it works on paper anyway."""
    n=0
    for page in writer.pages:
        a=page.get("/Annots")
        if not a: continue
        keep=[x for x in a if (x.get_object().get("/Subtype") != "/Link")]
        n+=len(a)-len(keep)
        if keep: page[pypdf.generic.NameObject("/Annots")]=pypdf.generic.ArrayObject(keep)
        else: 
            try: del page["/Annots"]
            except KeyError: pass
    return n


def main():
    os.makedirs(OUT, exist_ok=True)

    # Preflight: a missing year root silently drops whole tabs, so say so up front.
    _want = sorted({rel.split("/")[0] for _,_,_,_,items in TABS for _,_,rel in items})
    _missing = [d for d in _want if not os.path.isdir(os.path.join(SRC, d))]
    if _missing:
        print(f"FSM source root: {SRC}")
        for d in _missing: print(f"  !! MISSING SOURCE ROOT: {d}")
        print("  Tabs drawing on these will be incomplete. Set WRX_FSM_SRC to the folder holding them.\n")

    grand=0; built=[]; manifest=[]
    for tabno,title,subtitle,warnings,items in TABS:
        readers=[]; counts=[]
        for label,src,rel in items:
            path=os.path.join(SRC,rel)
            if not os.path.exists(path):
                print(f"  !! MISSING {rel}"); continue
            r=PdfReader(path); readers.append((label,src,r)); counts.append(len(r.pages))
        # Work out start pages up front so the cover can print them.
        pos=1; spans=[]
        for (label,src,_r),n in zip(readers,counts):
            spans.append({"label":label,"source":src,"start":pos+1,"pages":n})  # 1-based printed no.
            pos+=n
            if n % 2 == 1: pos+=1     # duplex pad
        w=PdfWriter()
        cv=cover(tabno,title,subtitle,traps_for(tabno),[(l,s,None) for l,s,_ in readers],
                 counts,[sp["start"] for sp in spans])
        w.append(cv, import_outline=False)
        for (label,src,r),n in zip(readers,counts):
            w.append(r, import_outline=False)
            if n % 2 == 1:            # pad so next section starts right-hand when duplexed
                w.add_blank_page()
        stamp(w, tabno, title, spans)
        nlink=strip_links(w)
        manifest.append({"tab":tabno,"title":title,"sections":spans,"pages":len(w.pages)})
        slug=title.replace(" / ","-").replace("/","-").replace(" — ","-").replace(" ","-").replace("+","").replace("--","-").strip("-")
        fn=os.path.join(OUT,f"TAB{tabno}_{slug}.pdf")
        with open(fn,"wb") as f: w.write(f)
        total=len(PdfReader(fn).pages); grand+=total
        built.append((fn,total,os.path.getsize(fn)))
        print(f"  TAB {tabno}  {total:4} pp  {os.path.getsize(fn)/1e6:6.1f} MB  {os.path.basename(fn)}")
    with open(os.path.join(OUT,"manifest.json"),"w") as f:
        json.dump(manifest,f,indent=1)
    print(f"\nTOTAL {grand} pages across {len(built)} files  ->  manifest.json")


if __name__ == "__main__":
    main()
