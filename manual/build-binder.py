#!/usr/bin/env python3
"""Combine every tab into ONE bookmarked WRX-BINDER.pdf for on-screen use.

The per-tab PDFs are what you print. This one is what you search and click.
Bookmarks are nested tab -> section, and each section records its printed
page number so the screen copy and the paper copy agree.
"""
import os, json
from pypdf import PdfWriter, PdfReader

OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "print")
FRONT = ["TAB0a_READ-FIRST.pdf", "TAB0_CONTENTS.pdf", "TAB0b_FLUIDS.pdf"]

mf = os.path.join(OUT, "manifest.json")
if not os.path.exists(mf):
    raise SystemExit("manifest.json missing — run build-manual.py first.")
manifest = json.load(open(mf))

# Match TAB<n>_ exactly - TAB7a_AS-WIRED.pdf must NOT be mistaken for TAB 7.
import re
tabfile = {}
for f in os.listdir(OUT):
    m = re.fullmatch(r"TAB(\d+)_.*\.pdf", f)
    if m: tabfile[int(m.group(1))] = f

w = PdfWriter(); pos = 0
for f in FRONT + ["TAB7a_AS-WIRED.pdf"]:
    p = os.path.join(OUT, f)
    if not os.path.exists(p):
        print(f"  !! skipped {f}"); continue
    r = PdfReader(p); w.append(r, import_outline=False)
    w.add_outline_item(f.replace(".pdf", "").replace("_", "  "), pos)
    pos += len(r.pages)

for t in manifest:
    f = tabfile.get(t["tab"])
    if not f:
        print(f"  !! no PDF for TAB {t['tab']}"); continue
    r = PdfReader(os.path.join(OUT, f))
    w.append(r, import_outline=False)
    parent = w.add_outline_item(f"TAB {t['tab']} — {t['title']}", pos)
    for s in t["sections"]:
        # s["start"] is the printed page number within the tab; -1 back to an index
        w.add_outline_item(f'{s["label"]}  ({s["source"]})  ·  {t["tab"]}-{s["start"]}',
                           pos + s["start"] - 1, parent=parent)
    pos += len(r.pages)

fn = os.path.join(OUT, "WRX-BINDER.pdf")
with open(fn, "wb") as f: w.write(f)
n = len(PdfReader(fn).pages)
print(f"WRX-BINDER.pdf — {n} pages, {os.path.getsize(fn)/1e6:.1f} MB, bookmarked")
