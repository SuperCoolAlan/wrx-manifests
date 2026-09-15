#!/usr/bin/env python3
"""Flag generated pages whose text runs outside the printable area.

Only OUR pages are checked - tab covers and the front-matter documents.
Subaru's own pages are their business and often bleed by design.
Run after manual/build-all.py.
"""
import os, sys, re
from pypdf import PdfReader

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "manual", "print")
TOP, BOTTOM, SIDE = 8.0, 4.0, 20.0   # footer band sits at y=6, so 4 is the floor

# Read the Tm operands straight out of the content stream rather than using
# pypdf's visitor_text, which reports tm=(0,0) for the first string after a font
# change and made every one of those look like text sitting at y=0. Safe here
# because this checker only ever looks at our own reportlab-generated pages, and
# reportlab emits an explicit "1 0 0 1 x y Tm" immediately before each Tj.
_TM = re.compile(rb"([-\d.]+)\s+([-\d.]+)\s+Tm\b")
_TJ = re.compile(rb"\((.*?)(?<!\\)\)\s*Tj", re.S)

def positions(page):
    try:
        data = page.get_contents().get_data()
    except AttributeError:
        return []                      # no content stream (blank padding page)
    hits = []
    for m in _TM.finditer(data):
        x, y = float(m.group(1)), float(m.group(2))
        block = data[m.end():]
        end = block.find(b"ET")        # stay inside this BT/ET block
        t = _TJ.search(block if end < 0 else block[:end])
        if not t: continue             # a Tm that positions no text
        txt = t.group(1).decode("latin-1", "replace")
        txt = txt.replace("\\(", "(").replace("\\)", ")").replace("\\\\", "\\")
        if txt.strip(): hits.append((x, y, txt.strip(), 0))
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
