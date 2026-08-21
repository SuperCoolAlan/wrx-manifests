#!/usr/bin/env python3
"""Generate TAB0_CONTENTS.pdf — the master contents + source-year matrix."""
import os
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch
from pypdf import PdfReader

OUT="/Users/alan/Documents/WRX/manual/print"
W,H=letter; M=0.75*inch
INK=(.10,.11,.13); MUTE=(.45,.46,.49); RULE=(.82,.82,.84)
WARNBG=(.99,.96,.90); WARNINK=(.55,.33,.05)

import json
_mf=os.path.join(OUT,"manifest.json")
if not os.path.exists(_mf):
    raise SystemExit("manifest.json missing - run build-manual.py first; the contents page "
                     "reports REAL page numbers and cannot be generated without it.")
TABS=[(t["tab"],t["title"],[(s2["label"],s2["source"],s2["start"],s2["pages"]) for s2 in t["sections"]])
      for t in json.load(open(_mf))]

MATRIX=[("Body, interior, glass, trim","2004 GG wagon","Sedan pages mislead — this is a wagon"),
 ("Chassis wiring / body harness","2004 GG","Spliced to a 2005 STi engine harness by iWire"),
 ("Engine — short block","2005 STi",""),
 ("Engine — HEADS / valvetrain","2007 H4DOTC","V25B STi Cosworth heads. 2007 STi has no ME section"),
 ("Engine harness","2005 STi","Diagrams do not describe this car post-merge"),
 ("Cooling","2005 H4DOTC","Mishimoto rad + ECFT, RCM pump + 70C thermostat"),
 ("Exhaust","2005 H4DOTC","REFERENCE ONLY — aftermarket end to end, catless"),
 ("Starting / charging","2005 H4SO","Singer 200A/220A, 14.8V reg — not the 90A OEM"),
 ("Brakes — calipers","2007","06-07 WRX 4/2-pot. Rotors are KNS aftermarket"),
 ("Front + rear suspension","2007 + 2005 + 2004","STi knuckles, WAGON links/subframe — all three needed"),
 ("Power steering","2004",""),
 ("Transmission / DCCD / driveline","2007 as proxy","Actual unit is a 2011 6MT. Verify torques vs 2011"),
 ("Clutch actuation","2004","2004 pedal/master/pipe/slave carry over"),
 ("Instrument cluster","2007 STi","07 STi cluster fitted"),
 ("Engine management","LINK — no FSM","All OEM ECU / OBD-II / immobilizer content VOID")]

VOID=["OEM ECU, OBD-II diagnostics, immobilizer — car runs a Link WRXLink WRX104X standalone",
 "OEM PCV system — replaced entirely by the IAG AOS",
 "TGV operation — TGVs deleted",
 "Fuel pump control module — FPCM bypassed, pump hardwired",
 "OEM strut and spring service — BC coilovers fitted",
 "Front O2 / rear O2 metering — Link CAN Lambda post-turbo, rear O2 deleted",
 "OEM alternator output specs — Singer 200A/220A with a 14.8V regulator",
 "OEM fluid table and maintenance intervals — all fluids re-specced for track use"]

# build-manual.py is hyphenated, so it cannot be a plain import - load it by path.
import importlib.util
_spec = importlib.util.spec_from_file_location(
    "build_manual", os.path.join(os.path.dirname(os.path.abspath(__file__)), "build-manual.py"))
_bm = importlib.util.module_from_spec(_spec); _spec.loader.exec_module(_bm)
NPARTS = sum(1 for _ in open(os.path.join(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))),"as-built","parts.csv"))) - 1
_T = _bm.TRAPS   # single source of truth, shared with the tab covers
TRAPS=_T   # ALL traps, tab-tagged. Never truncate this - a dropped trap is a trap missed.

c=canvas.Canvas(os.path.join(OUT,"TAB0_CONTENTS.pdf"),pagesize=letter)

# ---------- page 1 : contents ----------
c.setFillColorRGB(*INK); c.rect(0,H-1.55*inch,W,1.55*inch,fill=1,stroke=0)
c.setFillColorRGB(1,1,1); c.setFont("Helvetica-Bold",22)
c.drawString(M,H-0.95*inch,"WRX BUILD MANUAL")
c.setFont("Helvetica",8.6); c.setFillColorRGB(.75,.76,.78)
c.drawString(M,H-1.18*inch,"2004 GG wagon · V25B STi Cosworth heads on 2005-era EJ257 · FP Red · E85 · Link WRX104X · 2011 6MT/DCCD")
c.drawString(M,H-1.34*inch,"Assembled from the 2004 / 2005 / 2007 FSMs \u2014 sections come from DIFFERENT YEARS. Check the source column.")
y=H-1.92*inch
c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",8); c.drawString(M,y,"CONTENTS")
y-=5; c.setStrokeColorRGB(*RULE); c.setLineWidth(.7); c.line(M,y,W-M,y); y-=13
c.setFillColorRGB(*MUTE); c.setFont("Helvetica-Bold",7.2)
c.drawRightString(W-M-1.28*inch,y,"SOURCE")
c.drawRightString(W-M-0.42*inch,y,"PAGE")
c.drawRightString(W-M,y,"PP")

grand=0
for tn,title,secs in TABS:
    tot=sum(p for _,_,_,p in secs); grand+=tot
    c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",10.5)
    c.drawString(M,y,f"TAB {tn}   {title}")
    c.setFont("Helvetica-Bold",9); c.drawRightString(W-M,y,str(tot)); y-=12.5
    for lab,src,start,pp in secs:
        c.setFillColorRGB(.28,.29,.32); c.setFont("Helvetica",9.5)
        c.drawString(M+0.26*inch,y,lab)
        bold = ("2007 H4DOTC" in src) or ("H4SO" in src)
        c.setFont("Helvetica-Bold" if bold else "Helvetica",8.5)
        c.setFillColorRGB(*(WARNINK if bold else MUTE))
        c.drawRightString(W-M-1.28*inch,y,src)
        # printed page number, matching the footer stamped on every page
        c.setFillColorRGB(.10,.11,.13); c.setFont("Helvetica-Bold",9)
        c.drawRightString(W-M-0.42*inch,y,f"{tn}-{start}")
        c.setFillColorRGB(.45,.46,.49); c.setFont("Helvetica",8.5)
        c.drawRightString(W-M,y,str(pp)); y-=10.8
    y-=3.5
c.setStrokeColorRGB(*RULE); c.line(M,y+4,W-M,y+4); y-=10
c.setFont("Helvetica-Bold",10.5); c.drawString(M,y,f"TOTAL FSM PAGES"); c.drawRightString(W-M,y,str(grand))
c.setFont("Helvetica",7.5); c.setFillColorRGB(*MUTE)
c.drawString(M,0.42*inch,"Generated from manual/print-index.md · regenerate with manual/build-manual.py")
c.showPage()

# ---------- page 2 : matrix ----------
c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",17)
c.drawString(M,H-M-6,"System → Source Year Matrix")
c.setFont("Helvetica",9.5); c.setFillColorRGB(*MUTE)
c.drawString(M,H-M-24,"Which manual governs which system. This car is a hybrid — no single year applies.")
y=H-M-50
c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",8)
c.drawString(M,y,"SYSTEM"); c.drawString(M+2.35*inch,y,"GOVERNING SOURCE"); c.drawString(M+4.15*inch,y,"NOTE")
y-=5; c.setStrokeColorRGB(*RULE); c.line(M,y,W-M,y); y-=14
for sysname,src,note in MATRIX:
    c.setFillColorRGB(.28,.29,.32); c.setFont("Helvetica",9); c.drawString(M,y,sysname)
    hot = ("2007 H4DOTC" in src) or ("H4SO" in src) or ("LINK" in src)
    c.setFont("Helvetica-Bold" if hot else "Helvetica",9)
    c.setFillColorRGB(*(WARNINK if hot else (.28,.29,.32)))
    c.drawString(M+2.35*inch,y,src)
    c.setFillColorRGB(*MUTE); c.setFont("Helvetica",7.8); c.drawString(M+4.15*inch,y,note[:52])
    y-=14.5
y-=12
c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",8.5)
c.drawString(M,y,"VOID — THESE FSM SECTIONS DO NOT DESCRIBE THIS CAR"); y-=5
c.setStrokeColorRGB(*RULE); c.line(M,y,W-M,y); y-=13
c.setFont("Helvetica",8.6); c.setFillColorRGB(.28,.29,.32)
for v in VOID: c.drawString(M,y,"-  "+v); y-=12
c.setFont("Helvetica",7.5); c.setFillColorRGB(*MUTE)
c.drawString(M,0.55*inch,f"Full component detail: as-built/parts-register.md · {NPARTS} parts")
c.showPage()

# ---------- page 3+ : every trap, grouped by tab, paginated ----------
TABNAMES={1:"TAB 1  Front matter",2:"TAB 2  Engine",3:"TAB 3  Cooling / Exhaust / Charging",
          4:"TAB 4  Drivetrain",5:"TAB 5  Brakes",6:"TAB 6  Suspension / Chassis",
          7:"TAB 7  Electrical / Wiring",8:"TAB 8  Body / Interior"}

def trap_header(first):
    c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",17)
    c.drawString(M,H-M-6,"TRAPS — read before using any section" + ("" if first else "  (cont.)"))
    c.setFont("Helvetica",9.5); c.setFillColorRGB(*MUTE)
    c.drawString(M,H-M-24,"Every place this car departs from the manual in front of you. None of these are optional.")
    return H-M-52

y=trap_header(True); first=True
for tab in sorted(TABNAMES):
    lines=[t for tabs,t in TRAPS if tab in tabs]
    if not lines: continue
    if y < 1.5*inch:                      # never let a group run off the page
        c.showPage(); y=trap_header(False)
    c.setFillColorRGB(*WARNINK); c.setFont("Helvetica-Bold",9.5)
    c.drawString(M,y,TABNAMES[tab]); y-=6
    c.setStrokeColorRGB(*RULE); c.line(M,y,W-M,y); y-=13
    c.setFont("Helvetica",8.6); c.setFillColorRGB(.25,.20,.12)
    for t in lines:
        if y < 0.95*inch:
            c.showPage(); y=trap_header(False)
            c.setFont("Helvetica",8.6); c.setFillColorRGB(.25,.20,.12)
        c.drawString(M, y, ("   "+t.strip()) if t.startswith("   ") else ("-  "+t)); y-=12
    y-=10
c.setFont("Helvetica",7.5); c.setFillColorRGB(*MUTE)
c.drawString(M,0.42*inch,"Shared source with the tab cover pages — manual/build-manual.py TRAPS")
c.showPage(); c.save()
n=len(PdfReader(os.path.join(OUT,"TAB0_CONTENTS.pdf")).pages)
print(f"TAB0_CONTENTS.pdf — {n} pages")
