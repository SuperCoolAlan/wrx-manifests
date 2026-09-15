#!/usr/bin/env python3
"""Split WRX-BINDER.pdf into a COLOUR set and a MONO set for cheap printing.

Only the generated pages (front matter + each tab's cover) use colour. The FSM
pages are black line art apart from the amber source-year stamp in the footer,
which greyscales to a legible dark grey. So the colour set is tiny and every
colour page lands at a section boundary - collating is dropping each cover in
front of its tab, never interleaving mid-section.
"""
import os, json, re
from pypdf import PdfWriter, PdfReader

OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "print")
FRONT = ["TAB0a_READ-FIRST.pdf", "TAB0_CONTENTS.pdf", "TAB0b_FLUIDS.pdf", "TAB7a_AS-WIRED.pdf"]
manifest = json.load(open(os.path.join(OUT, "manifest.json")))
tabfile = {int(m.group(1)): f for f in os.listdir(OUT)
           if (m := re.fullmatch(r"TAB(\d+)_.*\.pdf", f))}

colour, mono, plan, pos = PdfWriter(), PdfWriter(), [], 0
for f in FRONT:                                   # wholly generated
    r = PdfReader(os.path.join(OUT, f)); n = len(r.pages)
    for p in r.pages: colour.add_page(p)
    plan.append((f.replace(".pdf",""), "COLOUR", pos+1, pos+n, n)); pos += n

for t in manifest:
    r = PdfReader(os.path.join(OUT, tabfile[t["tab"]]))
    # cover = whatever precedes the first section; sections are padded to even
    cov = t["sections"][0]["start"] - 1
    for p in r.pages[:cov]: colour.add_page(p)
    for p in r.pages[cov:]: mono.add_page(p)
    plan.append((f'TAB {t["tab"]}  {t["title"]} — cover', "COLOUR", pos+1, pos+cov, cov))
    plan.append((f'TAB {t["tab"]}  {t["title"]} — body',  "mono",   pos+cov+1, pos+len(r.pages), len(r.pages)-cov))
    pos += len(r.pages)

for w, name in ((colour, "WRX-BINDER-COLOR.pdf"), (mono, "WRX-BINDER-MONO.pdf")):
    with open(os.path.join(OUT, name), "wb") as fh: w.write(fh)

cn, mn = len(colour.pages), len(mono.pages)
print(f"{'SET':<7}{'PAGES':>7}{'SHEETS':>8}   file")
print(f"{'COLOUR':<7}{cn:>7}{-(-cn//2):>8}   WRX-BINDER-COLOR.pdf")
print(f"{'mono':<7}{mn:>7}{-(-mn//2):>8}   WRX-BINDER-MONO.pdf")
print(f"{'TOTAL':<7}{cn+mn:>7}{-(-cn//2)+-(-mn//2):>8}\n")
print(f"{'BINDER PAGES':<14}{'SET':<8}{'PP':>4}  SECTION")
for lab, kind, a, b, n in plan:
    if n: print(f"{f'{a}-{b}':<14}{kind:<8}{n:>4}  {lab}")
json.dump([{"section":l,"set":k,"first":a,"last":b,"pages":n} for l,k,a,b,n in plan if n],
          open(os.path.join(OUT,"print-plan.json"),"w"), indent=1)
