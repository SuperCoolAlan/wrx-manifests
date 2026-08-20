# WRX Build Documentation

**2004 Subaru WRX wagon (GG)** · Alan-built 2005-era EJ257 single-AVCS · FP Red · E85 · Link ECU standalone · 2011 STi 6MT w/ DCCD · 05-07 STi knuckles all four corners · 5x114.3
**Target:** 500whp, mostly track use
**Status:** assembled, never started

---

## Where things live

| Store | Holds | Authority |
|---|---|---|
| **This repo** | All build documentation | **Source of truth for what is on the car** |
| **Linear** — project `Subaru WRX` (team CPU) | Work tracking, todos, decisions in progress | Source of truth for **what to do next** |
| [Google Sheets master build sheet](https://docs.google.com/spreadsheets/d/1KrntpsHHwKKx_W9Vn28aLq9sGWfUYiJAk4-rHiAo67w/edit) | Purchasing status, shopping, costs | **Active** — procurement. Alan maintains. |
| ~~`20-21 2004 Wagon Build.xlsx`~~ (Dropbox) | — | **SUPERSEDED** — absorbed into this repo 2026-08-20 |

## Layout

```
as-built/     what IS on the car right now
procedures/   step-by-step work, in order
systems/      per-system detail, decisions and research
manual/       the FSM binder project
```

Filenames are deliberately unchanged from the flat layout — ~30 Linear issues
reference them by basename, and basenames are still unique.

### `as-built/` — current state of the car
| File | Contents |
|---|---|
| `parts.csv` | **Source of truth** for the parts list — 64 rows, 13 columns. Edit here. |
| `parts-register.md` | **Generated** from `parts.csv`. Every aftermarket part keyed to what it supersedes; doubles as the OEM deviations map. Do not hand-edit. |
| `as-built-engine-specs.md` | Measured bearing clearances, machining notes, rotating assembly |
| `hardware-reference.md` | Seal / bushing / axle / fastener / connector part numbers |

### `procedures/` — work to do, in sequence
| File | Contents |
|---|---|
| `build-todo.md` | Master sequenced task list to first start |
| `commissioning-checklist.md` | Pre-first-start → shakedown, tiered by consequence |
| `break-in-protocol.md` | Post-start break-in |

### `systems/` — detail and decisions
**Engine / induction:** `turbo_research_notes.md` · `aps_dr725_kit_inventory.md` · `cooling-system-notes.md`
**Fuel:** `fuel-pump-isolator-notes.md` · `e85_fuel_line_check.md` · `flex-fuel-sensor-bench-test.md`
**Electrical:** `electrical-grounding-notes.md` · `alternator-decision-notes.md` · `singer-alternator-spec-request.md`
**Chassis:** `brake-notes.md` · `suspension-notes.md` · `drivetrain-notes.md`

### Parts list — CSV as the data store

`as-built/parts.csv` holds the parts data; `as-built/parts-register.md` is generated from it.

```sh
python3 tools/gen-parts-register.py    # regenerate after editing the CSV
```

CSV rather than markdown tables for the data because git diffs it one part per
line — change a part number and the diff shows exactly that, instead of a
realigned table. It also opens directly in Sheets and greps cleanly.

The generated markdown derives three views automatically, so they can't drift:
wear/consumable schedule, spares & sell pile, and open items needing confirmation.

**Columns:** `system, tab, part, brand, model_pn, supersedes, fsm_impact, status, confidence, source, cost, wear_interval, notes`

```sh
grep '^brakes,' as-built/parts.csv                 # one system
grep -E 'unknown|unverified' as-built/parts.csv    # anything unconfirmed
grep -i 'KNS4651' as-built/parts.csv               # find a part number
awk -F, 'NR==1||$8=="to-buy"' as-built/parts.csv | column -t -s,
```

### `manual/` — service manual binder project
| File | Contents |
|---|---|
| `manual-toc-outline.md` | Structure and rationale for the assembled binder |
| `print-index.md` | What to print, tabbed, with real page counts |
| `print-manifest.md` | Source PDF → binder section mapping |

Source FSMs (2004 / 2005 / 2007 modular + 2011 monolith) live in Dropbox — not in this repo.

---

## What is deliberately NOT tracked

`.gitignore` excludes:
- **Personal documents** — title scan, insurance, receipts. These must never enter git history.
- **Large binaries** — PDFs, photos, 3D print files, archives
- **Bulk asset folders** — `eBay/`, `3D Prints/`, `wrx-tgv/`, `hammond/`, etc.
- **Spreadsheets** — superseded by the markdown above

The repo is ~150 KB of documentation. The working folder is ~150 MB. That is intentional.
