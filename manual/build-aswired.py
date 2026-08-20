#!/usr/bin/env python3
"""Generate TAB7a_AS-WIRED.pdf from as-built/wiring.csv.

Prints in FRONT of the FSM wiring diagrams. Those diagrams do not describe this
car; this sheet supersedes them for every circuit listed here.
"""
import csv, os
from collections import defaultdict
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch
from pypdf import PdfReader

ROOT=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CSVP=os.path.join(ROOT,"as-built","wiring.csv")
OUT=os.path.join(ROOT,"manual","print")
W,H=letter; M=0.7*inch
INK=(.10,.11,.13); MUTE=(.45,.46,.49); RULE=(.82,.82,.84)
WBG=(.99,.96,.90); WINK=(.55,.33,.05)

GROUPS=[("harness","HARNESS — what this car actually has"),
        ("ecu","ENGINE MANAGEMENT"),("fuel","FUEL SYSTEM"),("oiling","OILING"),
        ("induction","INDUCTION / BOOST CONTROL"),("drivetrain","DRIVETRAIN"),
        ("body","BODY / CLUSTER")]

rows=list(csv.DictReader(open(CSVP,encoding="utf-8")))
by=defaultdict(list)
for r in rows: by[r["system"]].append(r)
pins=[r for r in rows if r["pin"].strip() or r["connector"].strip()]

c=canvas.Canvas(os.path.join(OUT,"TAB7a_AS-WIRED.pdf"),pagesize=letter)

def head(first):
    if first:
        c.setFillColorRGB(*INK); c.rect(0,H-1.35*inch,W,1.35*inch,fill=1,stroke=0)
        c.setFillColorRGB(1,1,1); c.setFont("Helvetica-Bold",21)
        c.drawString(M,H-0.82*inch,"AS-WIRED — THIS SUPERSEDES THE DIAGRAMS BEHIND IT")
        c.setFont("Helvetica",9); c.setFillColorRGB(.75,.76,.78)
        c.drawString(M,H-1.08*inch,"A 2005 STi engine harness on a 2004 GG body harness, merged by iWire, with the factory ECU removed.")
        return H-1.75*inch
    c.setFillColorRGB(*INK); c.rect(0,H-0.7*inch,W,0.7*inch,fill=1,stroke=0)
    c.setFillColorRGB(1,1,1); c.setFont("Helvetica-Bold",12)
    c.drawString(M,H-0.45*inch,"AS-WIRED  (cont.)")
    return H-1.05*inch

y=head(True)

# Standing warning: this sheet is only as good as what has been written into it.
box=[ "Circuits listed here are MODIFIED. Where a circuit is NOT listed, the FSM diagram still applies.",
      f"Pin-level detail is recorded for {len(pins)} of {len(rows)} entries.",
      "Handwritten Link ECU pin notes are filed in this binder and are AUTHORITATIVE over any",
      "   printed pinout. If they conflict with this sheet, believe the handwritten notes."]
bh=len(box)*12+22
c.setFillColorRGB(*WBG); c.rect(M-9,y-bh+14,W-2*M+18,bh,fill=1,stroke=0)
c.setFillColorRGB(*WINK); c.setFont("Helvetica-Bold",8.6)
for i,t in enumerate(box):
    c.setFont("Helvetica" if t.startswith("   ") else "Helvetica-Bold",8.6)
    c.drawString(M,y,t if t.startswith("   ") else "-  "+t); y-=12
y-=20

def wrap(t,n):
    out=[];line=""
    for word in t.split():
        if len(line)+len(word)+1>n: out.append(line); line=word
        else: line=(line+" "+word).strip()
    if line: out.append(line)
    return out or [""]

for key,title in GROUPS:
    items=by.get(key,[])
    if not items: continue
    if y<1.4*inch: c.showPage(); y=head(False)
    c.setFillColorRGB(*WINK); c.setFont("Helvetica-Bold",9.5); c.drawString(M,y,title); y-=6
    c.setStrokeColorRGB(*RULE); c.line(M,y,W-M,y); y-=13
    for r in items:
        if y<1.0*inch: c.showPage(); y=head(False)
        cpw=" · ".join(x for x in (r["connector"],r["pin"],r["wire"]) if x.strip())
        c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",8.8)
        c.drawString(M,y,r["circuit"][:46])
        c.setFillColorRGB(*WINK); c.setFont("Helvetica-Bold",8)
        c.drawString(M+3.35*inch,y,r["change"].upper())
        if cpw:
            c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",8)
            c.drawRightString(W-M,y,cpw[:40])
        y-=11
        c.setFillColorRGB(.28,.29,.32); c.setFont("Helvetica",8.2)
        for ln in wrap(r["detail"],104): c.drawString(M+10,y,ln); y-=10
        if r["notes"].strip():
            c.setFillColorRGB(*WINK); c.setFont("Helvetica-Oblique",8)
            for ln in wrap(r["notes"],104): c.drawString(M+10,y,ln); y-=10
        y-=5
    y-=8

c.setFont("Helvetica",7.5); c.setFillColorRGB(*MUTE)
c.drawString(M,0.45*inch,"Generated from as-built/wiring.csv — edit that, then run manual/build-aswired.py")
c.showPage(); c.save()
print("TAB7a_AS-WIRED.pdf —",len(PdfReader(os.path.join(OUT,"TAB7a_AS-WIRED.pdf")).pages),"pages")
