# As-Built Engine Specs

**Engine:** 2005-era EJ257, single AVCS. **Built by Alan.**
**Source:** measurements inherited from `20-21 2004 Wagon Build.xlsx` → "Bearing Clearances" sheet (Dropbox archive, now superseded by this file)
**Captured:** 2026-08-20

---

## Main (crankshaft) bearing clearances — Plastigage

### Test One — all STD shells
| Journal | mm | inches | vs goal (0.0012-0.0017") |
|---|--:|--:|---|
| Front | 0.034 | 0.00134 | ✅ in range |
| 2 | 0.026 | 0.00102 | ⚠️ below min |
| 3 | 0.030 | 0.00118 | ⚠️ marginally below min |
| 4 | 0.031 | 0.00122 | ✅ just above min |
| Thrust | 0.030 | 0.00118 | ⚠️ marginally below min |

### Test Two — mixed shells ← **THIS IS WHAT WAS BUILT**
| Journal | Shell combination | mm | inches | vs goal |
|---|---|--:|--:|---|
| Front | **Mix R-STD** | 0.034 | 0.00134 | ✅ |
| 2 | **Mix L-STD** | 0.035 | 0.00138 | ✅ |
| 3 | **Mix R-STD** | 0.036 | 0.00142 | ✅ |
| 4 | **Mix R-STD** | 0.035 | 0.00138 | ✅ |
| Thrust | **Mix L-STD** | — | *"Ruined the wax so going with it"* | not measured |

**Result: all measured mains land 0.00134-0.00142", comfortably inside the 0.0012-0.0017" window.** Mixing STD and STDX halves was the method used to bring the tight journals into range.

### Target reference used
| | min (in) | ideal (in) |
|---|--:|--:|
| Front, 2, 3, 4, Rear truss | 0.0012 | 0.0017 |

**Stock reference points:** goal 0.030 mm (0.00118") · limit 0.040 mm (0.001575")

---

## Rod bearing clearances

| Journal | Shell | mm | inches |
|---|---|--:|--:|
| Front | **STDX** | 0.025 | 0.00098 |
| 2 | STDX | — | not recorded |
| 3 | STDX | — | not recorded |
| 4 | STDX | — | not recorded |

⚠️ **Only the front rod journal has a recorded figure; 2/3/4 are blank in the source sheet.** If a complete record is wanted for the binder, these are the gap.

❓ The front rod reading of 0.00098" is tighter than the main-bearing target window quoted above. Rod targets are normally specified separately from mains — **confirm which target was being used for rods**, and whether these were re-measured after the recorded entry.

---

## Bearing shells as fitted
- **Rod bearings:** King race series, **STD**
- **Main bearings:** King race series, **STDX**
- Per build sheet note: *"Ran STD rod bearings but STDX crank bearings"*
- Mains then fine-tuned by mixing shell halves per Test Two above

## Machining
- **Cylinder wall boring** — Lucitos Machine Shop, $100
- ⚠️ Build sheet note: *"Didn't match the pistons — just did them all to the same size (gave unclear instructions I guess)"*
- ❓ **Actual measured bore diameter and piston-to-wall clearance are NOT recorded anywhere.** This is the remaining gap in the as-built record.

## Rotating assembly
| Component | Spec |
|---|---|
| Crankshaft | Subaru OEM nitride-treated STi, **12200AA430** |
| Pistons | Manley **612000C-4**, 99.75mm std stroke, std bore, **8.5:1 dish** |
| Rods | Manley **H-Tuff 15024-4** |
| Oil pump | **11mm**, 15010AA360 |
| Damper | Fluidampr **531101** |
| Valve springs | Manley **22180-16** w/ titanium retainers |

## Tools used for assembly
| Tool | Source |
|---|---|
| Plastigage PL-X (0.018-0.045 mm), white | eBay |
| Company 23 piston ring compressor | Defined Performance, $49.95 |
| Seal puller | Harbor Freight |

---

## Remaining as-built gaps
- [ ] Rod bearing clearances, journals 2 / 3 / 4
- [ ] Thrust bearing clearance (wax ruined during Test Two)
- [ ] Measured bore diameter + piston-to-wall clearance
- [ ] Ring end gaps
- [ ] Deck height / squish, if measured
- [ ] Valve lash as-set figures (see valve lash project)
