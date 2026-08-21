#!/usr/bin/env python3
"""Combine every tab into ONE WRX-BINDER.pdf for on-screen use.

No bookmarks and no link annotations - they were unreliable across viewers.
Navigation is by PAGE NUMBER only: every page carries an absolute binder
number in the bottom-left, so the number you type into a PDF viewer is the
number printed on the page. Section start pages are written to
binder-index.json for the contents page to print.
"""
import os, io, json
import pypdf
from pypdf import PdfWriter, PdfReader
from reportlab.pdfgen import canvas

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

w = PdfWriter(); pos = 0; index = []
for f in FRONT + ["TAB7a_AS-WIRED.pdf"]:
    p = os.path.join(OUT, f)
    if not os.path.exists(p):
        print(f"  !! skipped {f}"); continue
    r = PdfReader(p); w.append(r, import_outline=False)
    index.append({"tab": None, "label": f.replace(".pdf", "").replace("_", "  "), "abs": pos + 1})
    pos += len(r.pages)

for t in manifest:
    f = tabfile.get(t["tab"])
    if not f:
        print(f"  !! no PDF for TAB {t['tab']}"); continue
    r = PdfReader(os.path.join(OUT, f))
    w.append(r, import_outline=False)
    for sec in t["sections"]:
        # sec["start"] is the printed page number within the tab; -1 back to an index
        index.append({"tab": t["tab"], "label": sec["label"],
                      "abs": pos + sec["start"]})
    pos += len(r.pages)

# Absolute page number bottom-left, so viewer page == printed page.
buf = io.BytesIO(); cs = canvas.Canvas(buf)
for i, page in enumerate(w.pages):
    mb = page.mediabox
    pw, ph = float(mb.width), float(mb.height)
    rot = (page.get("/Rotate") or 0) % 360
    cs.setPageSize((pw, ph) if rot in (0, 180) else (ph, pw))
    cs.saveState()
    if rot: cs.translate(pw if rot == 180 else 0, ph if rot in (90, 180) else 0); cs.rotate(-rot)
    cs.setFillColorRGB(.99, .99, .99); cs.rect(0, 0, 62, 17, fill=1, stroke=0)
    cs.setFillColorRGB(.20, .21, .24); cs.setFont("Helvetica-Bold", 7.4)
    cs.drawString(6, 6, f"BINDER {i+1}")
    cs.restoreState(); cs.showPage()
cs.save(); buf.seek(0)
ov = PdfReader(buf)
for i, page in enumerate(w.pages):
    try: page.merge_page(ov.pages[i])
    except Exception as e: print(f"  !! stamp failed on page {i+1}: {e}")

nlink = 0
for page in w.pages:
    a = page.get("/Annots")
    if not a: continue
    keep = [x for x in a if x.get_object().get("/Subtype") != "/Link"]
    nlink += len(a) - len(keep)
    if keep: page[pypdf.generic.NameObject("/Annots")] = pypdf.generic.ArrayObject(keep)
    else:
        try: del page["/Annots"]
        except KeyError: pass
if nlink: print(f"  stripped {nlink} link annotations")

json.dump(index, open(os.path.join(OUT, "binder-index.json"), "w"), indent=1)

fn = os.path.join(OUT, "WRX-BINDER.pdf")
with open(fn, "wb") as f: w.write(f)
n = len(PdfReader(fn).pages)
print(f"WRX-BINDER.pdf — {n} pages, {os.path.getsize(fn)/1e6:.1f} MB  ->  binder-index.json")
