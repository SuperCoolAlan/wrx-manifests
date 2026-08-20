# Continental Flex Fuel Sensor Bench Test Procedure

**Sensor:** Continental PPA-IGF35 / GM 13577429 (same physical sensor, dual-labeled)
**Date written:** 2026-05-22
**Build:** 2004 WRX wagon + 07 EJ257 + Link G4X

## Purpose

Verify the used Continental flex fuel sensor is functional before installing in the fuel system. Confirms electronics work AND ethanol sensing element responds correctly.

## Equipment Needed

- ✅ DC power supply (set to 12V — sensor accepts 9-18V per Continental spec)
- ✅ Oscilloscope (any basic 2-channel scope works — sensor outputs square wave at 50-150 Hz)
- ✅ Multimeter (for current draw measurement)
- **2.2k-3.3kΩ pull-up resistor** (required for bench test — see signal protocol below). NOTE: 2.2k-3.3kΩ (NOT 10kΩ — doesn't work with this sensor) does NOT work with this sensor per Link forums; use 2.2k or 3.3k.
- Test leads with hooks/clips
- Small container of pump gas (E10) — for ethanol response test (optional for full validation)
- Small container of E85 — for ethanol response test (optional for full validation)

## Pinout

3-pin Delphi GT 150 connector on sensor (viewed from face of male connector on sensor body):

| Pin | Function | Typical wire color (harness side) |
|-----|----------|----------------------------------|
| **A (1)** | +12V switched power | Pink |
| **B (2)** | Ground | Black |
| **C (3)** | Signal output (open-collector square wave) | White |

Verify pin positions on actual connector — they're typically marked A/B/C or 1/2/3 in the plastic housing.

## Signal Protocol (Critical)

The sensor is **open-collector output**: Pin 3 (signal) is normally floating and pulses to ground when the sensor switches. The vehicle ECU normally provides an internal 5V pull-up to make the pulses readable.

**For final install on Link G4X:** Link's digital input channels have configurable internal pull-ups — Ben enables this in PCLink config. **No external pull-up resistor needed for the final install.**

**For BENCH testing only:** You need an external pull-up. CORRECT VALUE: 2.2k-3.3kΩ (3.3k recommended). 10kΩ does NOT work with this sensor per Link forum testing.

```
+5V (or +12V) ── 2.2k-3.3kΩ (NOT 10kΩ — doesn't work with this sensor) resistor ── Pin 3 (signal output)
```

Use either +5V or +12V — both work. The 2.2k-3.3kΩ (NOT 10kΩ — doesn't work with this sensor) value mirrors the ECU's internal pull-up.

## Bench Test Wiring Diagram

```
DC Supply +12V ──────────────────── Pin A (Pink)   ← Power
                              │
                              └──── 2.2k-3.3kΩ (NOT 10kΩ — doesn't work with this sensor) resistor
                                         │
                                         ├──── Pin C (White) ← Signal
                                         │
                                         └──── Scope probe tip

DC Supply GND ──────────────────── Pin B (Black)  ← Ground
                              │
                              └──── Scope GND clip
```

## Test Sequence

### Test 1: Power-On Baseline (Sensor in Air)

This is the most important test — confirms the sensor's electronics are alive.

| Measurement | Equipment | Expected | Pass criteria |
|-------------|-----------|----------|---------------|
| **Current draw at 12V** | Multimeter in series with +12V lead | ~15-25 mA | Current draw exists and is stable |
| **Signal frequency in air** | Scope on Pin 3; measure period of square wave, calculate f = 1/T | **~50 Hz** | Stable frequency around 50 Hz baseline |
| **Signal amplitude** | Scope on Pin 3; measure peak-to-peak voltage | **~5V** (if 5V pull-up) or **~12V** (if 12V pull-up) | Square wave shows clear high/low transitions |
| **Signal shape** | Scope on Pin 3; observe waveform | Clean square wave with sharp edges | No noise, no DC offset, no missing pulses |
| **Pulse width (fuel temp)** | Scope on Pin 3; measure pulse high-time | **~1ms at room temp** | Pulse width is measurable (~1-5ms range; 1ms cold, 5ms hot) |

**This is enough for a basic "is it dead?" check.** If you see a clean 50 Hz square wave with proper amplitude, the sensor's electronics work.

### Test 2: Pump Gas Response (E10)

Submerge the sensor's fuel passage in pump gasoline (E10).

| Measurement | Expected |
|-------------|----------|
| Frequency | **~55-60 Hz** (slight increase from baseline — E10 has 10% ethanol) |
| Signal shape | Same clean square wave |
| Stability | Frequency holds steady (no drift after a few seconds) |

### Test 3: E85 Response

Submerge the sensor's fuel passage in E85.

| Measurement | Expected |
|-------------|----------|
| Frequency | **~125-140 Hz** (pump E85 is typically E70-E83 seasonally; pure E85 = 135 Hz) |
| Signal shape | Same clean square wave |
| Stability | Frequency holds steady |

### Test 4: Temperature Response (Optional)

Heat the sensor body with a hair dryer or heat gun (gentle, don't melt the plastic) while monitoring scope pulse width.

| Measurement | Expected |
|-------------|----------|
| Pulse width at room temp | ~1ms |
| Pulse width when warmed | Increases toward ~3-5ms |
| Frequency | Unchanged (frequency is ethanol %, pulse width is temperature — independent measurements) |

## Frequency-to-Ethanol Conversion Table

Linear relationship: **Ethanol % = (Frequency in Hz - 50) × 1.0**

| Frequency | Ethanol % | Fuel type |
|-----------|-----------|-----------|
| **50 Hz** | 0% | Pure gasoline (E0) |
| **60 Hz** | 10% | E10 (pump gas in most US states) |
| **70 Hz** | 20% | E20 |
| **85 Hz** | 35% | Custom blend |
| **100 Hz** | 50% | E50 (winter pump E85 in some areas) |
| **120 Hz** | 70% | E70 (winter pump E85 typical) |
| **133 Hz** | 83% | E83 (summer pump E85 typical) |
| **135 Hz** | 85% | E85 (nominal) |
| **150 Hz** | 100% | E100 (pure ethanol — rare outside lab) |
| **>180 Hz** | ⚠️ Out of range | **Fault: contamination, water, or sensor failure** |

## Pass / Fail Criteria

| Result | Diagnosis |
|--------|-----------|
| ✅ ~50 Hz in air, clean square wave, proper amplitude | Electronics work |
| ✅ Frequency increases when E10/E85 introduced | Ethanol sensing element works |
| ✅ Pulse width changes with temperature | Temperature element works |
| ✅ Current draw 15-25 mA at 12V | Internal circuits operating correctly |
| ❌ No signal / DC stuck high or low even with pull-up | Sensor electronics dead |
| ❌ Frequency stuck at one value regardless of fuel composition | Sensing element failed |
| ❌ Frequency >180 Hz in air with no fuel | Sensor faulted or contaminated |
| ❌ Erratic/noisy signal | Internal damage |
| ❌ No current draw | Power circuit open |

## Quick Test (Minimum Viable Verification)

If you don't want to mess with fuel samples, just do **Test 1 (power-on in air)** — confirms sensor isn't dead.

Defer full ethanol response verification until first install: read Link ECU's flex fuel input live data on first start with whatever fuel is in the tank, confirm frequency reading makes sense.

## Safety Notes

- E85 and gasoline fumes — work in well-ventilated area or outdoors
- E85 is corrosive to many plastics; use **glass or polypropylene** containers for fuel samples, NOT PET bottles (which dissolve in ethanol over time)
- Dry the sensor passage before disconnecting power (prevents corrosion on terminals)
- Don't leave the sensor powered for extended periods in still air — internal heating can throw off baseline reading slightly
- Keep the multimeter in CURRENT mode (not voltage!) when in series with the power lead — wrong mode = blown fuse

## Reference

- Continental sensor spec: 9-18V operating range, 50-150 Hz frequency output, pulse width 1-5ms for temperature
- Open-collector signal protocol (pulls to ground, requires external pull-up on bench)
- Sensor used in millions of GM flex-fuel vehicles since 2006 — extremely well-documented design
- Link G4X has built-in calibration for this sensor type (no custom cal table needed)

## After Bench Test Passes

1. Mark sensor body as "bench tested OK" with date
2. Install per build plan:
   - Mount on ASA 3D-printed bracket (driver firewall area near fuel filter)
   - Inline in return-side fuel line
   - Connect to Ben's Rear O2→Flex Fuel expansion harness (Delphi GT 150 3-pin)
3. On first ECU power-up: verify Link reads sensor (flex fuel input live data)
4. After first drive: confirm reading matches actual fuel (E10 should read ~60 Hz, E85 should read ~125-135 Hz)

## Related Files

- Build memory: `/Users/alan/.claude/projects/-Users-alan-Documents-WRX/memory/project_engine_build.md`
- Spreadsheet row 43: Flex Fuel Sensor
- Alternator decision notes: `/Users/alan/Documents/WRX/alternator-decision-notes.md`

## Sources

- ifixshit.wordpress.com — Flex Fuel Sensor Bench Testing Continental
- Motorsport Electronics UK — Flex Fuel Sensor online help
- Megasquirt forum — Set up Continental Flex Fuel Sensor 13577394
- FuelTech manual — Flex Fuel Sensor #5005100353 PDF
- Link ECU forum — Continental Flex fuel sensor topic
- Haltech — How Flex Fuel Control Works article
