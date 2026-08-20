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

TABS=[(1,"FRONT MATTER",[("Identification (VIN/chassis)","2004",5),("Notes & symbols","2004",7),
        ("Precautions","2004",1),("Specifications — WRX baseline","2004",7),
        ("Specifications — STi figures","2005",16),("Recommended Materials (fluids)","2004  ref only",7),
        ("Periodic Maintenance","2004  ref only",42)]),
      (2,"ENGINE",[("Mechanical — SHORT BLOCK","2005 STi",93),
        ("Mechanical — HEADS / VALVETRAIN","2007 H4DOTC",102),("General Description","2005 STi",270),
        ("Lubrication","2005 STi",22),("Intake","2005 STi",17),("Ignition","2005 STi",7),
        ("Fuel Injection","2005 STi  ref",64),("Emission Control","2005 STi",20)]),
      (3,"COOLING / EXHAUST / CHARGING",[("Cooling","2005 H4DOTC",34),
        ("Exhaust","2005 H4DOTC  ref only",14),("Starting / Charging","2005 H4SO",22)]),
      (4,"DRIVETRAIN — 6MT + DCCD",[("6MT Transmission & Differential","2007",126),
        ("Control Systems — DCCD (mech only)","2007",50),("Clutch — 6MT side","2007",38),
        ("Clutch — 2004 actuation specs","2004",34),("Differentials (R180)","2007",58),
        ("Drive Shaft / axles","2007",46)]),
      (5,"BRAKES",[("Brakes","2007",58),("Parking Brake","2007",10),("ABS","2007",22)]),
      (6,"SUSPENSION / CHASSIS",[("Front Susp — STi knuckle/hub","2007",26),("Front Susp — cross-ref","2005",28),
        ("Front Susp — WAGON chassis","2004 GG",28),("Rear Susp — STi knuckle/hub","2007",18),
        ("Rear Susp — cross-ref","2005",20),("Rear Susp — WAGON chassis","2004 GG",20),
        ("Power Steering","2004",60),("Wheel & Tire","2007",10)]),
      (7,"ELECTRICAL / WIRING",[("Body harness","2004 GG",198),("Engine harness","2005 STi",220),
        ("Instrument cluster","2007 STi",20),("Lighting","2004",30)]),
      (8,"BODY / INTERIOR — wagon",[("Exterior / Interior Trim","2004",60),
        ("Body Structure","2004",22),("Glass / Windows / Mirrors","2004",34)])]

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

VOID=["OEM ECU, OBD-II diagnostics, immobilizer — car runs a Link G4X standalone",
 "OEM PCV system — replaced entirely by the IAG AOS",
 "TGV operation — TGVs deleted",
 "Fuel pump control module — FPCM bypassed, pump hardwired",
 "OEM strut and spring service — BC coilovers fitted",
 "Front O2 / rear O2 metering — Link CAN Lambda post-turbo, rear O2 deleted",
 "OEM alternator output specs — Singer 200A/220A with a 14.8V regulator",
 "OEM fluid table and maintenance intervals — all fluids re-specced for track use"]

import sys; sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
from build_manual import TRAPS as _T   # single source of truth, shared with the tab covers
TRAPS=[t.strip() for tabs,t in _T if not t.startswith("   ")][:9]

c=canvas.Canvas(os.path.join(OUT,"TAB0_CONTENTS.pdf"),pagesize=letter)

# ---------- page 1 : contents ----------
c.setFillColorRGB(*INK); c.rect(0,H-1.55*inch,W,1.55*inch,fill=1,stroke=0)
c.setFillColorRGB(1,1,1); c.setFont("Helvetica-Bold",22)
c.drawString(M,H-0.95*inch,"WRX BUILD MANUAL")
c.setFont("Helvetica",8.6); c.setFillColorRGB(.75,.76,.78)
c.drawString(M,H-1.18*inch,"2004 GG wagon · V25B STi Cosworth heads on 2005-era EJ257 · FP Red · E85 · Link G4X · 2011 6MT/DCCD")
c.drawString(M,H-1.34*inch,"Assembled from the 2004 / 2005 / 2007 FSMs \u2014 sections come from DIFFERENT YEARS. Check the source column.")
y=H-1.92*inch
c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",8); c.drawString(M,y,"CONTENTS")
c.drawRightString(W-M-0.75*inch,y,"SOURCE"); c.drawRightString(W-M,y,"PP")
y-=5; c.setStrokeColorRGB(*RULE); c.setLineWidth(.7); c.line(M,y,W-M,y); y-=13
grand=0
for tn,title,secs in TABS:
    tot=sum(p for _,_,p in secs); grand+=tot
    c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",10.5)
    c.drawString(M,y,f"TAB {tn}   {title}")
    c.setFont("Helvetica-Bold",9); c.drawRightString(W-M,y,str(tot)); y-=12.5
    for lab,src,pp in secs:
        c.setFillColorRGB(.28,.29,.32); c.setFont("Helvetica",9.5)
        c.drawString(M+0.26*inch,y,lab)
        bold = ("2007 H4DOTC" in src) or ("H4SO" in src)
        c.setFont("Helvetica-Bold" if bold else "Helvetica",8.5)
        c.setFillColorRGB(*(WARNINK if bold else MUTE))
        c.drawRightString(W-M-0.75*inch,y,src)
        c.setFillColorRGB(.28,.29,.32); c.setFont("Helvetica",9)
        c.drawRightString(W-M,y,str(pp)); y-=10.8
    y-=3.5
c.setStrokeColorRGB(*RULE); c.line(M,y+4,W-M,y+4); y-=10
c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",11)
c.drawString(M,y,"TAB 9   CUSTOM — build-specific documents, no FSM equivalent")
c.drawRightString(W-M,y,"\u2014"); y-=18
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
bh=len(TRAPS)*12+26
c.setFillColorRGB(*WARNBG); c.rect(M-9,y-bh+14,W-2*M+18,bh,fill=1,stroke=0)
c.setFillColorRGB(*WARNINK); c.setFont("Helvetica-Bold",8.5); c.drawString(M,y,"TRAPS — READ BEFORE USING ANY SECTION"); y-=14
c.setFont("Helvetica",8.6); c.setFillColorRGB(.25,.20,.12)
for t in TRAPS: c.drawString(M,y,"-  "+t); y-=12
y-=22
c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",8.5); c.drawString(M,y,"VOID — THESE FSM SECTIONS DO NOT DESCRIBE THIS CAR"); y-=5
c.setStrokeColorRGB(*RULE); c.line(M,y,W-M,y); y-=13
c.setFont("Helvetica",8.6); c.setFillColorRGB(.28,.29,.32)
for v in VOID: c.drawString(M,y,"-  "+v); y-=12
c.setFont("Helvetica",7.5); c.setFillColorRGB(*MUTE)
c.drawString(M,0.55*inch,"Full component detail: as-built/parts-register.md · 128 parts")
c.showPage(); c.save()
n=len(PdfReader(os.path.join(OUT,"TAB0_CONTENTS.pdf")).pages)
print(f"TAB0_CONTENTS.pdf — {n} pages")
