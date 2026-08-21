#!/usr/bin/env python3
"""Flag generated pages whose text runs outside the printable area.

Only OUR pages are checked - tab covers and the front-matter documents.
Subaru's own pages are their business and often bleed by design.
Run after manual/build-all.py.
"""
import os, sys, json
from pypdf import PdfReader

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "manual", "print")
TOP, BOTTOM, SIDE = 8.0, 4.0, 20.0   # footer band sits at y=6, so 4 is the floor

def positions(page):
    hits = []
    def visit(text, cm, tm, font, size):
        if text.strip(): hits.append((tm[4], tm[5], text.strip(), size or 0))
    page.extract_text(visitor_text=visit)
    return hits

def check(path, page_idxs, label):
    r = PdfReader(path); bad = []
    for i in page_idxs:
        if i >= len(r.pages): continue
        pg = r.pages[i]
        W, H = float(pg.mediabox.width), float(pg.mediabox.height)
        for x, y, txt, size in positions(pg):
            why = None
            if y < BOTTOM: why = f"below bottom (y={y:.0f})"
            elif y > H - TOP: why = f"above top (y={y:.0f} of {H:.0f})"
            elif x < 0 or x > W - SIDE: why = f"off right/left edge (x={x:.0f} of {W:.0f})"
            if why: bad.append((label, i + 1, why, txt[:64]))
    return bad

targets = []
for f in sorted(os.listdir(OUT)):
    if not f.endswith(".pdf") or f == "WRX-BINDER.pdf": continue
    p = os.path.join(OUT, f)
    if f.startswith("TAB0") or f.startswith("TAB7a"):
        targets.append((p, range(len(PdfReader(p).pages)), f))   # wholly generated
    else:
        targets.append((p, [0], f))                              # cover page only

problems = []
for p, idxs, lab in targets: problems += check(p, idxs, lab)

if not problems:
    print("no overflow — all generated pages fit")
else:
    print(f"{len(problems)} overflow(s):\n")
    for lab, pg, why, txt in problems:
        print(f"  {lab}  p{pg}  {why}\n      {txt!r}")
sys.exit(1 if problems else 0)
