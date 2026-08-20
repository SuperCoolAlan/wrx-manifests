#!/usr/bin/env python3
"""Splice the WRX build manual from the source FSM PDFs, per manual/print-index.md.

One PDF per binder tab. Each gets a generated cover page listing contents and
source year, then the sections, bookmarked. Sections are padded to even page
counts so every section starts on a right-hand page when duplexed.
"""
import os, io, sys
from pypdf import PdfWriter, PdfReader
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch


# ── TRAPS — single source of truth. Tagged by tab; the TOC imports this. ──────
# Each entry: (tabs it applies to, text)
TRAPS = [
 ((2,),   "HEADS come from the 2007 manual (ME(H4DOTC)). Everything below them"),
 ((2,),   "   from 2005 STi. V25B STi Cosworth heads = 2007-era casting."),
 ((2,),   "THIS ENGINE IS SINGLE AVCS - intake only, one solenoid per head. The 2007"),
 ((2,),   "   H4DOTC manual documents DUAL AVCS. Every exhaust-side AVCS sprocket,"),
 ((2,),   "   solenoid and oil path in those figures DOES NOT EXIST on this car."),
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
 ((6,),   "THREE YEARS HERE, each doing a different job: 2004 = WAGON chassis side"),
 ((6,),   "   (subframe, link mounting, wagon torques). 2007/2005 = STi knuckle,"),
 ((6,),   "   hub and bearing procedures."),
 ((7,),   "These diagrams do NOT describe this car - 2005 STi engine harness was"),
 ((7,),   "   merged to the 2004 GG body harness by iWire."),
 ((7,),   "All OEM ECU / OBD-II / immobilizer content is VOID - car runs a Link WRX104X."),
 ((7,),   "CRUISE CONTROL IS NOT FITTED - deliberately left unwired at harness build."),
 ((7,),   "   It is not broken. Do not diagnose it. SP Speed Control is VOID."),
 ((7,),   "Knock sensor: 24 N.m, and the cord must exit at 60 degrees to engine rear."),
 ((1,),   "Recommended Materials + Periodic Maintenance are REFERENCE ONLY."),
 ((1,),   "   All fluids are re-specced; PM is rewritten for track use."),
 ((5,),   "Rotors are KNS gravel-spec aftermarket: KNS4651 front / KNS4656 rear."),
 ((5,),   "Rear rotor carries the R180 STi parking brake drum - see PB section."),
 ((5,),   "PARKING BRAKE CABLES ARE THE ORIGINAL 2004 CHASSIS CABLES and are verified"),
 ((5,),   "   holding on these discs, despite the 05-07 STi rear knuckles. Use the"),
 ((5,),   "   2004 cable routing and adjustment procedure, not the STi one."),
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
 (2,"ENGINE","Short block = 2005 STi. HEADS = 2007 H4DOTC.",
  [],
  [("Mechanical — SHORT BLOCK","2005 STi",Y5+"STi Engine/ME(STi) 04 Mechanical.pdf"),
   ("Mechanical — HEADS / VALVETRAIN","2007 H4DOTC",Y7+"H4DOTC Engine/ME(H4DOTC) Mechanical.pdf"),
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
   ("Parking Brake","2007",Y7+"Chassis/PB Parking Brake.pdf"),
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
   ("Wheel & Tire","2007",Y7+"Chassis/WT Wheel & Tire .pdf")]),
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

def cover(tabno, title, subtitle, warnings, items, counts):
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
    c.drawString(m,y,"CONTENTS"); y-=4
    c.setStrokeColorRGB(.80,.80,.82); c.setLineWidth(.6); c.line(m,y,W-m,y); y-=20
    for (label,src,_),n in zip(items,counts):
        c.setFillColorRGB(.10,.11,.13); c.setFont("Helvetica",11); c.drawString(m,y,label)
        c.setFillColorRGB(.42,.43,.46); c.setFont("Helvetica",9)
        c.drawRightString(W-m-0.85*inch,y,src)
        c.setFillColorRGB(.10,.11,.13); c.setFont("Helvetica",10)
        c.drawRightString(W-m,y,f"{n} pp")
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

def main():
    os.makedirs(OUT, exist_ok=True)

    # Preflight: a missing year root silently drops whole tabs, so say so up front.
    _want = sorted({rel.split("/")[0] for _,_,_,_,items in TABS for _,_,rel in items})
    _missing = [d for d in _want if not os.path.isdir(os.path.join(SRC, d))]
    if _missing:
        print(f"FSM source root: {SRC}")
        for d in _missing: print(f"  !! MISSING SOURCE ROOT: {d}")
        print("  Tabs drawing on these will be incomplete. Set WRX_FSM_SRC to the folder holding them.\n")

    grand=0; built=[]
    for tabno,title,subtitle,warnings,items in TABS:
        readers=[]; counts=[]
        for label,src,rel in items:
            path=os.path.join(SRC,rel)
            if not os.path.exists(path):
                print(f"  !! MISSING {rel}"); continue
            r=PdfReader(path); readers.append((label,src,r)); counts.append(len(r.pages))
        w=PdfWriter()
        cv=cover(tabno,title,subtitle,traps_for(tabno),[(l,s,None) for l,s,_ in readers],counts)
        w.append(cv, import_outline=False)
        w.add_outline_item(f"TAB {tabno} — {title}", 0)
        pos=1
        for (label,src,r),n in zip(readers,counts):
            w.append(r, import_outline=False)
            w.add_outline_item(f"{label}  ({src})", pos)
            pos+=n
            if n % 2 == 1:            # pad so next section starts right-hand when duplexed
                w.add_blank_page(); pos+=1
        slug=title.replace(" / ","-").replace("/","-").replace(" — ","-").replace(" ","-").replace("+","").replace("--","-").strip("-")
        fn=os.path.join(OUT,f"TAB{tabno}_{slug}.pdf")
        with open(fn,"wb") as f: w.write(f)
        total=len(PdfReader(fn).pages); grand+=total
        built.append((fn,total,os.path.getsize(fn)))
        print(f"  TAB {tabno}  {total:4} pp  {os.path.getsize(fn)/1e6:6.1f} MB  {os.path.basename(fn)}")
    print(f"\nTOTAL {grand} pages across {len(built)} files")


if __name__ == "__main__":
    main()
