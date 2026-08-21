#!/usr/bin/env python3
"""Generate as-built/parts-register.md from as-built/parts.csv.

parts.csv is the source of truth. Never hand-edit the generated markdown —
edits there are lost on the next run.
"""
import csv, os, sys
from collections import Counter, defaultdict

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CSV = os.path.join(ROOT, "as-built", "parts.csv")
OUT = os.path.join(ROOT, "as-built", "parts-register.md")

SYSTEMS = [
    ("engine-lower",   "Engine — Lower Internals", 2),
    ("engine-heads",   "Engine — Heads & Valvetrain", 2),
    ("oiling",         "Oiling", 2),
    ("cooling",        "Cooling", 3),
    ("induction",      "Turbo · Induction · Exhaust", 3),
    ("fuel",           "Fuel System", 4),
    ("ecu-electrical", "Engine Management · Electrical", 7),
    ("drivetrain",     "Drivetrain", 4),
    ("brakes",         "Brakes", 5),
    ("suspension",     "Suspension · Chassis", 6),
    ("fluids",         "Fluids & Capacities", "-"),
    ("tools",          "Assembly Tools (not on the car)", "-"),
]
MARK = {"confirmed": "✅", "unverified": "⚠️", "unknown": "❓"}

def money(v):
    try: return f"${float(v):,.2f}"
    except (ValueError, TypeError): return ""

def num(v):
    """Costs are sometimes ranges ('80-130') or blank; those don't roll up."""
    try: return float(v)
    except (ValueError, TypeError): return 0.0

rows = list(csv.DictReader(open(CSV, encoding="utf-8")))
by_sys = defaultdict(list)
for r in rows:
    by_sys[r["system"]].append(r)

L = []
w = L.append
w("<!-- GENERATED FROM parts.csv — DO NOT EDIT BY HAND. Run: python3 tools/gen-parts-register.py -->")
w("")
w("# Aftermarket Parts Register")
w("")
w("**Car:** 2004 GG wagon · Alan-built 2005-era EJ257 single-AVCS · FP Red · E85 · Link ECU · "
  "2011 6MT/DCCD · 05-07 STi knuckles all corners · 5x114.3 · 500whp target, mostly track")
w("")
w("> **This is the deviations map, not just an inventory.** Every row marks a place the OEM "
  "manual is now wrong. The **Supersedes** column links each part to the FSM section it "
  "invalidates, keeping the binder and the car reconciled.")
w("")
w("**Source of truth:** [`parts.csv`](parts.csv) — edit that, then regenerate.")
w("**Confidence:** ✅ confirmed · ⚠️ recorded but unverified · ❓ needs confirmation")
w("")
c = Counter(r["status"] for r in rows)
w(f"**{len(rows)} parts** — " + " · ".join(f"{v} {k}" for k, v in sorted(c.items(), key=lambda x: -x[1])))
w("")
w("---")
w("")

for key, title, tab in SYSTEMS:
    items = by_sys.get(key, [])
    if not items: continue
    spent = sum(num(r["cost"]) for r in items)
    head = f"## {title}" + (f" · Binder TAB {tab}" if tab != "-" else "")
    if spent: head += f" · recorded spend {money(spent)}"
    w(head)
    w("")
    w("| ✓ | Part | Brand / Model / PN | Supersedes | Notes |")
    w("|:-:|---|---|---|---|")
    for r in sorted(items, key=lambda x: x["part"]):
        bm = " ".join(x for x in [r["brand"], r["model_pn"]] if x).strip()
        note = r["notes"]
        if r["fsm_impact"]:
            note = f"**FSM: {r['fsm_impact']}**" + (f" · {note}" if note else "")
        if r["status"] not in ("installed",):
            note = f"*[{r['status']}]* " + note
        w(f"| {MARK.get(r['confidence'],'')} | {r['part']} | {bm} | {r['supersedes']} | {note} |")
    w("")

# ── derived views ───────────────────────────────────────────
wear = [r for r in rows if r["wear_interval"]]
if wear:
    w("---")
    w("")
    w("## Wear & consumable items — track maintenance view")
    w("")
    w("| Item | Interval | System |")
    w("|---|---|---|")
    for r in sorted(wear, key=lambda x: x["system"]):
        w(f"| {r['part']} ({r['brand']}) | {r['wear_interval']} | {r['system']} |")
    w("")

nb = [r for r in rows if r["status"] in ("sell", "spare")]
if nb:
    w("---")
    w("")
    w("## Not installed — spares / sell")
    w("")
    w("| Part | Brand / Model | Status | Notes |")
    w("|---|---|---|---|")
    for r in nb:
        w(f"| {r['part']} | {r['brand']} {r['model_pn']} | {r['status']} | {r['notes']} |")
    w("")

open_q = [r for r in rows if r["confidence"] in ("unknown", "unverified")]
if open_q:
    w("---")
    w("")
    w("## Open items — needs confirmation")
    w("")
    for r in sorted(open_q, key=lambda x: (x["confidence"] != "unknown", x["system"])):
        w(f"- [ ] {MARK[r['confidence']]} **{r['part']}** ({r['system']}) — {r['notes'] or 'unverified'}")
    w("")

w("---")
w("")
w("## Querying")
w("")
w("```sh")
w("# everything still to buy")
w("awk -F, 'NR==1||$8==\"to-buy\"' as-built/parts.csv | column -t -s,")
w("")
w("# anything unconfirmed")
w("grep -E 'unknown|unverified' as-built/parts.csv")
w("")
w("# one system")
w("grep '^brakes,' as-built/parts.csv")
w("")
w("# find a part number")
w("grep -i 'KNS4651' as-built/parts.csv")
w("```")

open(OUT, "w", encoding="utf-8").write("\n".join(L) + "\n")
print(f"wrote {OUT} — {len(rows)} parts across {len(by_sys)} systems")
