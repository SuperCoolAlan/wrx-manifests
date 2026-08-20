#!/usr/bin/env python3
"""Generate as-built/wiring-register.md from as-built/wiring.csv.

wiring.csv is the source of truth. Never hand-edit the generated markdown.
Pin-level rows (connector/pin/wire filled in) are what a next owner actually
needs; rows without them are system-level notes.
"""
import csv, os
from collections import defaultdict

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CSV = os.path.join(ROOT, "as-built", "wiring.csv")
OUT = os.path.join(ROOT, "as-built", "wiring-register.md")

GROUPS = [("harness","Harness — what this car actually has"),
          ("ecu","Engine management"),
          ("fuel","Fuel system"),
          ("oiling","Oiling"),
          ("induction","Induction / boost control"),
          ("drivetrain","Drivetrain"),
          ("body","Body / cluster")]
MARK = {"confirmed":"✅","to-verify":"⚠️","unknown":"❓"}

rows = list(csv.DictReader(open(CSV, encoding="utf-8")))
by = defaultdict(list)
for r in rows: by[r["system"]].append(r)

L=[]; w=L.append
w("<!-- GENERATED FROM wiring.csv — DO NOT EDIT BY HAND. Run: python3 tools/gen-wiring-register.py -->")
w("")
w("# As-Wired Register — harness deviations")
w("")
w("> **The FSM wiring diagrams do not describe this car.** A 2005 STi engine harness was")
w("> merged onto a 2004 GG body harness by iWire, and the factory ECU is gone. This register")
w("> supersedes those diagrams for every circuit listed. Where a circuit is *not* listed,")
w("> the FSM diagram still applies.")
w("")
w(f"**{len(rows)} recorded deviations** · ✅ confirmed · ⚠️ needs verification")
w("")
pins = [r for r in rows if r["pin"].strip() or r["connector"].strip()]
w(f"**Pin-level detail recorded for {len(pins)} of {len(rows)} rows.** "
  "Rows without a connector/pin are system-level notes, not wiring instructions.")
w("")
w("---")
w("")
for key,title in GROUPS:
    items = by.get(key,[])
    if not items: continue
    w(f"## {title}")
    w("")
    w("| ✓ | Circuit | Connector · Pin · Wire | Change | Detail | Why |")
    w("|:-:|---|---|---|---|---|")
    for r in items:
        cpw = " · ".join(x for x in (r["connector"],r["pin"],r["wire"]) if x.strip()) or "—"
        w(f"| {MARK.get(r['verified'],'')} | {r['circuit']} | {cpw} | **{r['change']}** | "
          f"{r['detail']} | {r['reason']} |")
        if r["notes"].strip():
            w(f"| | | | | {r['notes']} | |")
    w("")
todo = [r for r in rows if r["verified"] != "confirmed"]
if todo:
    w("---")
    w("")
    w("## Needs verification")
    w("")
    for r in todo:
        w(f"- [ ] **{r['circuit']}** — {r['notes'] or r['detail']}")
    w("")
open(OUT,"w",encoding="utf-8").write("\n".join(L)+"\n")
print(f"wrote {OUT} — {len(rows)} deviations, {len(pins)} with pin-level detail")
