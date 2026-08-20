# E85 Fuel Line Check + Decision Plan

For the 500whp E85 STI build. Use this checklist at home to verify existing braided fuel lines and decide path forward.

## Strategy Overview

**The decision hinges on whether existing lines are PTFE-lined.**

```
┌─────────────────────────────────────────────────────┐
│  EXISTING LINES PTFE-LINED?                         │
├─────────────────────────────────────────────────────┤
│  ✅ YES → REUSE PTFE hose, source odds-and-ends     │
│           Cost: $100-300                            │
│                                                      │
│  ❌ NO  → REPLACE with new                          │
│           Option A: DIY w/ new PTFE hose: $300-470  │
│           Option B: IAG complete kit: $550-600      │
└─────────────────────────────────────────────────────┘
```

PTFE doesn't age — if existing lines are confirmed PTFE, they're still good regardless of age.

---

## Step 1: Identify Hose Type (do this first)

### A. Read hose markings — look for printed/embossed text along hose length

#### ✅ GOOD — these mean reusable
- [ ] **"PTFE"** or **"Teflon"** — universally fuel-safe
- [ ] **"E85"** explicitly stamped
- [ ] **"SAE J30R14"** — newer alcohol fuel rating
- [ ] **"SAE J30R12"** — modern fuel-resistant rating
- [ ] **"FKM"** or **"Viton"** — fluoroelastomer, E85 safe
- [ ] Branded E85 lines:
  - "Race-Crimp PTFE" (Earl's)
  - "ProFlex PTFE" (Russell)
  - "Vapor Guard" (Earl's)
  - "Speed-Flex" (Earl's)
  - "FCM" (Aeroquip)

#### ❌ BAD — these mean replace
- [ ] **"SAE J30R6"** or **"J30R7"** — older rubber, NOT E85 safe
- [ ] **"NBR"** or **"Nitrile"** — incompatible with E85
- [ ] **"Buna-N"** — same as nitrile
- [ ] No markings at all (assume worst-case)

### B. Inspect inner liner at the cut end

| Liner Appearance | Material | Verdict |
|---|---|---|
| White/cream/translucent, hard plastic feel | **PTFE** ⭐ | ✅ REUSE |
| Black/dark green rubber, slightly oily | FKM/Viton | ✅ REUSE if <5 yr |
| Glossy yellow-tinted | Hytrel | ✅ REUSE |
| Black rubber, smooth | Nitrile (NBR) | ❌ REPLACE |
| Dark grey rubber, smooth | CPE | ❌ REPLACE (marginal) |

#### Quick PTFE test
- Press the liner with your fingernail
- ✅ **PTFE:** Springs right back, feels hard/plasticky
- ❌ **Rubber:** Compresses easily, stays compressed momentarily

### C. Brand lookup (if you remember source)
- **Earl's Race-Crimp PTFE** ✅
- **Russell ProFlex PTFE** ✅
- **Earl's Vapor Guard** ✅ (rubber-lined J30R14)
- **Earl's Speed-Flex** ✅
- **Aeroquip FCM** ✅
- **Earl's Pro-Lite 350** ❌ (older nitrile)
- **Aeroquip Socketless FC332** ❌ (older)
- **Russell ProFlex** (standard) ⚠️ marginal
- **Goodridge 200/600** — check spec sheet

---

## Path A: Existing Lines Are PTFE — REUSE STRATEGY

### What you'll need to buy (odds-and-ends, ~$100-300)

| Item | Approx Cost | Notes |
|---|---|---|
| Subaru fuel rail adapter (-6AN to factory rail) | $60-100 | Specialty Subaru part — main expense |
| 2-4× PTFE-compatible AN ends | $40-120 | Only if existing ends are damaged or one-time crimp |
| Banjo-to-AN adapter (return side) | $30-50 | If routing requires it |
| Misc adapters / clamps | $20-40 | |
| **Total** | **$150-310** | |

### Where to source
- **Summit Racing** — best inventory, fast shipping
- **Jegs** — similar, sometimes better deals
- **Pegasus Auto Racing** — niche race-grade
- **eBay** — used Subaru rail adapters sometimes 50% off retail

### Critical: Buy NEW reusable AN ends if existing ones are
- Crimp-style (one-time use)
- Visibly worn
- Bent or scuffed
- Ferrule appears compromised

PTFE-compatible AN ends: $15-30 each.

---

## Path B: Lines Are NOT PTFE / Need Replacement

### Option B1: DIY with new PTFE hose ($300-470)

| Item | Cost |
|---|---|
| 6 ft PTFE hose (Earl's Race-Crimp or Russell ProFlex) | $90-120 |
| 4× PTFE-specific AN ends | $80-120 |
| Subaru fuel rail adapter | $60-100 |
| Banjo adapter + misc fittings | $50-100 |
| **Total** | **$280-440** |

### Option B2: IAG Complete Fuel Line Kit (~$550)
- Pre-fabricated, no cutting, no assembly
- PTFE construction
- Designed for 06-07 STI fitment
- Compatible with Cobb flex fuel sensor (which we have)
- Includes Subaru fuel rail adapter
- Tuner install much easier

### B1 vs B2 honest tradeoff
- **B2 saves 2-3 hr of tuner labor** (~$160-450 at $80-150/hr)
- **B2 net cost** ≈ **B1 cost** after factoring labor
- **B2 less risk** of wrong fittings / re-orders / delays
- **B1 only wins** if you're buying parts incrementally or doing your own install

---

## Re-Termination Process (if reusing PTFE hose)

### Tools needed
- [ ] Hose cutter or cutoff wheel ($20-30)
- [ ] AN wrenches set ($30-50)
- [ ] Vise (preferably with hose jaws)
- [ ] Blue tape (mark cut location)
- [ ] Razor blade (trim braid frays)

### Steps
1. [ ] Mark cut location with tape (prevents braid fraying)
2. [ ] Cut clean with cutoff wheel
3. [ ] Trim braid frays with razor blade
4. [ ] If PTFE: install olive/insert per fitting instructions
5. [ ] Slide socket onto hose (threads facing hose end)
6. [ ] Lubricate threads (use approved fluid for PTFE)
7. [ ] Screw nipple INTO socket while gripping hose in vise
8. [ ] Torque per AN spec
9. [ ] **Pressure test with shop air to ~80 psi** BEFORE running fuel through
10. [ ] Visual inspect for any leaks or seepage

---

## Inspection Notes — Fill In When Home

### Fuel Line 1 (feed line if multiple)
- [ ] Markings found: ___________________
- [ ] Inner liner color/feel: ___________________
- [ ] Fingernail test result: ___________________
- [ ] Length: ___________________ ft
- [ ] AN size (if known): ___________________
- [ ] Age estimate: ___________________
- [ ] Brand (if known): ___________________
- [ ] Existing fitting condition (reusable / damaged): ___________________
- [ ] **Verdict:** [ ] PTFE - REUSE  [ ] FKM - REUSE  [ ] Rubber - REPLACE  [ ] Unknown - REPLACE

### Fuel Line 2 (return line if separate)
- [ ] Markings found: ___________________
- [ ] Inner liner color/feel: ___________________
- [ ] Fingernail test result: ___________________
- [ ] Length: ___________________ ft
- [ ] AN size (if known): ___________________
- [ ] **Verdict:** [ ] PTFE - REUSE  [ ] FKM - REUSE  [ ] Rubber - REPLACE  [ ] Unknown - REPLACE

### Existing AN Fittings
- [ ] Type: [ ] Reusable two-piece  [ ] One-time crimp
- [ ] AN size: ___________________
- [ ] Condition: [ ] Good - reuse  [ ] Worn - replace
- [ ] Quantity reusable: ___________________

---

## Action Plan Based on Findings

### If PTFE confirmed → ORDER LIST
- [ ] Subaru -6AN fuel rail adapter
- [ ] PTFE-compatible AN ends (qty as needed)
- [ ] Banjo adapter (if return line uses one)
- [ ] Misc adapters/clamps

### If rubber/uncertain → DECISION
- [ ] Going DIY ($300-470)? Source list:
  - 6 ft new PTFE hose
  - 4× PTFE AN ends
  - Subaru fuel rail adapter
  - Banjo + misc
- [ ] Going IAG kit ($550)? Order:
  - IAG PTFE Fuel Line Kit (06-07 WRX/STI fitment)
  - Verify Cobb flex sensor compatibility version

---

## Bottom Line

- **PTFE is forever** — if existing lines are PTFE, age doesn't matter, just verify visually + functionally
- **Aged rubber is gambling** — don't bet a $5,000+ engine on saving $400
- **Cost of replacement ($300-600) is rounding error** vs cost of fuel-related engine failure
- **Pressure test BEFORE running fuel** regardless of new or reused

When you've inspected, fill in the notes section above and we can finalize the order.
