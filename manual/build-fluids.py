#!/usr/bin/env python3
"""Generate TAB0b_FLUIDS.pdf — merged fluids & capacities. No single FSM year applies."""
import os
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch
from pypdf import PdfReader

OUT="/Users/alan/Documents/WRX/manual/print"
W,H=letter; M=0.7*inch
INK=(.10,.11,.13); MUTE=(.45,.46,.49); RULE=(.82,.82,.84)
WBG=(.99,.96,.90); WINK=(.55,.33,.05)

# system, product, spec/PN, OEM capacity (STi 6MT column), actual/notes
ROWS=[
 ("ENGINE OIL — break-in","Motul Break-In 10W-40","108080 (1L)","4.3 L / 4.5 qt*","* OEM figure w/ filter. IAG pan changes it - MEASURE"),
 ("ENGINE OIL — synthetic","Motul 300V Competition 5W-40","110817 (2L) x3","4.3 L / 4.5 qt*","From 750 mi. HTHS 4.0. OCI 1200-1500 mi on E85"),
 ("COOLANT","Asian-formula, green pref.","phosphate, silicate-free","7.7 L / 8.1 qt","2 gal concentrate + 2 gal DISTILLED, 50/50"),
 ("TRANSMISSION 6MT","Motul Gear 300 75W-90","105777 (1L)","4.1 L / 4.3 qt","Shares sump with FRONT DIFF + DCCD"),
 ("REAR DIFF R180","Motul Gear 300 75W-90","105777 (1L)","1.0 L / 1.1 qt","STi column. Torsen - NO friction modifier"),
 ("BRAKE FLUID","ATE Typ 200 (DOT 4)","DOT 4","500 mL / 16.9 fl oz","Entire brake system, per FSM. Reservoir 205 cm3"),
 ("CLUTCH FLUID","ATE Typ 200 (DOT 4)","DOT 4 - same fluid","70 mL / 2.4 fl oz","Total clutch system, per FSM. SEPARATE CIRCUIT, own bleed"),
 ("POWER STEERING","Any Dexron III ATF","1 qt","0.7 L / 0.7 qt","Subaru PS spec is Dexron ATF"),
]

FLAGS=["ENGINE OIL CAPACITY IS NOT THE OEM FIGURE. The IAG pan changes it.",
 "   Fill to the dipstick, measure what goes in, and write the real number here: ______",
 "GEAR OIL: 4.1 L trans + 1.0 L rear = 5.1 L TOTAL. Fill to the level plug, not a volume.",
 "R180 IS 1.0 L, NOT 0.8 L. The 0.8 figure is the non-STi column - that is the R160.",
 "COOLANT: 1 gal concentrate + 1 gal distilled = 8 qt of mix for an 8.1 qt system.",
 "   Buy 2 gal + 2 gal - otherwise there is no margin for ECFT burping or spills.",
 "BRAKE + CLUTCH ARE SEPARATE CIRCUITS. Same fluid, two bleeds. Never DOT 5."]

CAPNOTE=("Radiator caps","Mishimoto radiator ships TWO 1.3 bar caps: ONE-WAY on the radiator, TWO-WAY on the ECFT. "
          "They are NOT interchangeable - fitting them backwards stops the system drawing coolant back on "
          "cooldown or relieving properly. OEM was ~0.9 bar.")

c=canvas.Canvas(os.path.join(OUT,"TAB0b_FLUIDS.pdf"),pagesize=letter)
c.setFillColorRGB(*INK); c.rect(0,H-1.4*inch,W,1.4*inch,fill=1,stroke=0)
c.setFillColorRGB(1,1,1); c.setFont("Helvetica-Bold",21)
c.drawString(M,H-0.88*inch,"FLUIDS & CAPACITIES")
c.setFont("Helvetica",8.6); c.setFillColorRGB(.75,.76,.78)
c.drawString(M,H-1.12*inch,"NO SINGLE FSM YEAR APPLIES. Capacities are the 2005 STi 6MT column; products are all re-specced for a 500whp E85 track car.")
y=H-1.72*inch
c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",7.5)
for x,lab in ((M,"SYSTEM"),(M+1.45*inch,"PRODUCT"),(M+3.25*inch,"SPEC / PN"),(M+4.85*inch,"CAPACITY")):
    c.drawString(x,y,lab)
y-=4; c.setStrokeColorRGB(*RULE); c.setLineWidth(.7); c.line(M,y,W-M,y); y-=13
for sysn,prod,pn,cap,note in ROWS:
    c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",8.3); c.drawString(M,y,sysn)
    c.setFont("Helvetica",8.3); c.setFillColorRGB(.28,.29,.32)
    c.drawString(M+1.45*inch,y,prod[:30])
    c.setFont("Helvetica",7.6); c.setFillColorRGB(*MUTE); c.drawString(M+3.25*inch,y,pn[:30])
    c.setFont("Helvetica-Bold",8.3); c.setFillColorRGB(*INK); c.drawString(M+4.85*inch,y,cap)
    y-=10.5
    c.setFont("Helvetica",7.2); c.setFillColorRGB(*MUTE); c.drawString(M+1.45*inch,y,note[:78])
    y-=12.5
y-=2
bh=len(FLAGS)*11+24
c.setFillColorRGB(*WBG); c.rect(M-8,y-bh+12,W-2*M+16,bh,fill=1,stroke=0)
c.setFillColorRGB(*WINK); c.setFont("Helvetica-Bold",8.2); c.drawString(M,y,"BEFORE YOU FILL ANYTHING"); y-=13
c.setFont("Helvetica",8); c.setFillColorRGB(.25,.20,.12)
for f in FLAGS:
    c.drawString(M,y,("-  "+f) if not f.startswith("   ") else f); y-=11
y-=20
head,body=CAPNOTE
c.setFillColorRGB(*INK); c.setFont("Helvetica-Bold",8.2); c.drawString(M,y,head.upper()); y-=4
c.setStrokeColorRGB(*RULE); c.line(M,y,W-M,y); y-=13
c.setFillColorRGB(.28,.29,.32); c.setFont("Helvetica",8)
words=body.split(); line=""
for wd in words:
    if c.stringWidth(line+" "+wd,"Helvetica",8) > (W-2*M):
        c.drawString(M,y,line); y-=11; line=wd
    else: line=(line+" "+wd).strip()
c.drawString(M,y,line); y-=15
c.setFont("Helvetica",7.2); c.setFillColorRGB(*MUTE)
c.drawString(M,0.42*inch,"Capacities from 2005 FSM SPC Specs, STi 6MT column · products per build sheet Fluids tab · regenerate with manual/build-fluids.py")
c.showPage(); c.save()
print("TAB0b_FLUIDS.pdf —",len(PdfReader(os.path.join(OUT,"TAB0b_FLUIDS.pdf")).pages),"page")
