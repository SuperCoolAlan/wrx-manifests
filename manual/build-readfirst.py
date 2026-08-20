#!/usr/bin/env python3
"""TAB0a_READ-FIRST.pdf — orientation page. Assumes the reader knows nothing about this car."""
import os
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch
from pypdf import PdfReader

OUT="/Users/alan/Documents/WRX/manual/print"
W,H=letter; M=0.7*inch
INK=(.10,.11,.13); MUTE=(.45,.46,.49); RULE=(.82,.82,.84)
WBG=(.99,.96,.90); WINK=(.55,.33,.05); RED=(.62,.16,.12)

SECTIONS=[
 ("THIS IS NOT A STOCK 2004 WRX", RED, [
  "The chassis is a 2004 Impreza WRX wagon (GG). Almost nothing else is.",
  "Engine: 2005-era EJ257 short block, built, with V25B STi Cosworth cylinder heads.",
  "Forced induction: Forced Performance Red turbo, external wastegate, front-mount intercooler.",
  "Transmission: 2011 STi 6-speed with DCCD and matching R180 diff - see below.",
  "Suspension: 05-07 STi knuckles on all four corners, wagon links, BC Racing coilovers.",
  "Brakes: 06-07 WRX 4-piston front / 2-piston rear on KNS gravel-spec rotors.",
  "Wheel bolt pattern is 5x114.3, NOT the 5x100 a 2004 WRX left the factory with."]),
 ("FUEL — READ BEFORE FILLING", WINK, [
  "This car is set up for E85 and runs a flex-fuel sensor. The ECU reads ethanol",
  "content and adapts. It is not a pump-gas car that tolerates E85; it is built for it.",
  "Target output is roughly 500 wheel horsepower."]),
 ("DIAGNOSTICS — THERE IS NO OBD-II", WINK, [
  "The factory ECU has been removed. The car runs a Link G4X standalone.",
  "A generic OBD-II scanner will not communicate with it and is not a sign of a fault.",
  "Diagnosis, datalogging and tuning all require Link software and a laptop.",
  "There is no immobilizer and no factory emissions monitoring. The downpipe is catless."]),
 ("DRIVETRAIN — A 2011 GEARBOX IN A 2004 CAR", WINK, [
  "The transmission is a 2011 STi 6-speed with DCCD, fitted with its matching R180",
  "rear differential from the same donor, so the front and rear final drive ratios agree.",
  "",
  "No 2011 sections are printed in this binder. The 2011 factory manual is a single",
  "3,350-page file with no bookmarks and heavily interleaved sections. The 2007 manual",
  "covers the same DCCD 6-speed family and is used as the readable proxy - but VERIFY",
  "torque figures and fluid capacities against a 2011 manual before relying on them.",
  "",
  "DCCD is controlled by an aftermarket DCCDPro controller, not the factory unit.",
  "Do not look for factory DCCD switches - the manual's Control Systems section",
  "describes hardware this car does not have. Use it for the centre differential only.",
  "",
  "Clutch actuation is deliberately mixed: the 2004 pedal, master cylinder, hard line",
  "and slave cylinder are retained - both are pull type with the same 1.7 lever ratio -",
  "while the release fork and throwout bearing are the 6-speed parts. Ordering clutch",
  "hydraulics by model year will get you the wrong half."]),
 ("WHY THIS MANUAL COMES FROM SEVERAL DIFFERENT YEARS", INK, [
  "No single Subaru manual describes this car. Sections are drawn from the 2004, 2005",
  "and 2007 FSMs depending on which part is actually fitted, with 2007 standing in for",
  "the 2011 transmission - and in a few places the correct section is filed under a",
  "different engine code than you would expect.",
  "The contents page lists the source year for every section. Check it before trusting",
  "any procedure. The System to Source Year matrix on the following page explains why."]),
 ("SECTIONS OF THE FACTORY MANUAL THAT DO NOT APPLY", INK, [
  "Factory ECU, OBD-II diagnostics and immobilizer  -  Link G4X standalone",
  "PCV system  -  replaced entirely by an air-oil separator",
  "Tumble generator valves  -  deleted",
  "Fuel pump control module  -  bypassed, pump is hardwired",
  "Strut and spring service  -  coilovers fitted",
  "Oxygen sensor metering  -  wideband post-turbo, rear sensor deleted",
  "Alternator output specs  -  high-output unit with a 14.8V regulator",
  "Fluid table and service intervals  -  all re-specced; see the Fluids page"]),
]

c=canvas.Canvas(os.path.join(OUT,"TAB0a_READ-FIRST.pdf"),pagesize=letter)

def banner(first):
    if first:
        c.setFillColorRGB(*INK); c.rect(0,H-1.45*inch,W,1.45*inch,fill=1,stroke=0)
        c.setFillColorRGB(1,1,1); c.setFont("Helvetica-Bold",23)
        c.drawString(M,H-0.9*inch,"READ THIS FIRST")
        c.setFont("Helvetica",9); c.setFillColorRGB(.75,.76,.78)
        c.drawString(M,H-1.15*inch,"Orientation for anyone servicing this car. It differs from a factory 2004 WRX in ways that will mislead you if you assume otherwise.")
        return H-1.85*inch
    c.setFillColorRGB(*INK); c.rect(0,H-0.75*inch,W,0.75*inch,fill=1,stroke=0)
    c.setFillColorRGB(1,1,1); c.setFont("Helvetica-Bold",12)
    c.drawString(M,H-0.5*inch,"READ THIS FIRST  ·  continued")
    return H-1.15*inch

def footer():
    c.setFont("Helvetica",7.5); c.setFillColorRGB(*MUTE)
    c.drawString(M,0.5*inch,"2004 Impreza WRX wagon (GG)  \u00b7  built 2005-era EJ257  \u00b7  V25B STi Cosworth heads  \u00b7  FP Red  \u00b7  E85  \u00b7  Link G4X  \u00b7  2011 6MT / DCCD")

y=banner(True); first=True
for title,col,lines in SECTIONS:
    need = 18 + len(lines)*11.5 + 13
    if y - need < 1.05*inch:
        footer(); c.showPage(); first=False; y=banner(False)
    c.setFillColorRGB(*col); c.setFont("Helvetica-Bold",9.5); c.drawString(M,y,title); y-=5
    c.setStrokeColorRGB(*RULE); c.setLineWidth(.6); c.line(M,y,W-M,y); y-=13
    c.setFillColorRGB(.24,.25,.28); c.setFont("Helvetica",8.8)
    for ln in lines: c.drawString(M,y,ln); y-=11.5
    y-=13

box=["Full component detail, including part numbers for everything aftermarket, is in the",
     "accompanying parts register. Measured engine build figures - bearing clearances and",
     "machining notes - are in the as-built engine specification."]
bh=len(box)*11+26
if y - bh < 1.05*inch:
    footer(); c.showPage(); y=banner(False)
c.setFillColorRGB(*WBG); c.rect(M-8,y-bh+13,W-2*M+16,bh,fill=1,stroke=0)
c.setFillColorRGB(*WINK); c.setFont("Helvetica-Bold",8.5); c.drawString(M,y,"WHERE THE REST OF IT IS"); y-=14
c.setFont("Helvetica",8.5); c.setFillColorRGB(.25,.20,.12)
for b in box: c.drawString(M,y,b); y-=11
footer(); c.showPage(); c.save()
print("TAB0a_READ-FIRST.pdf —",len(PdfReader(os.path.join(OUT,"TAB0a_READ-FIRST.pdf")).pages),"pages")
