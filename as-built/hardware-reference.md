# Hardware & Small Parts Reference — MERGED

> **This file no longer holds part data.** Every seal, bushing, axle, fastener and
> connector that used to live here is now a row in [`parts.csv`](parts.csv), which is
> the single source of truth. See the generated [`parts-register.md`](parts-register.md).
>
> The split was the problem: searching the register for "axle" returned nothing while
> the answer sat in this file.

## Finding what used to be here

```sh
grep -i axle        as-built/parts.csv   # axles + CV seals
grep '^suspension,' as-built/parts.csv   # hubs, bearings, bushings
grep -i 'gauge harness' as-built/parts.csv   # Mouser connector BOM
grep '^tools,'      as-built/parts.csv   # assembly tools
```

## Historical cost totals — archival only

From `20-21 2004 Wagon Build.xlsx` (Dropbox), the spreadsheet this repo replaced.
These are **not** per-part figures; per-part costs live in the `cost` column of `parts.csv`.

| Section | Total |
|---|--:|
| Drivetrain | $4,814.29 |
| Electrical | $3,671.33 |
| Intake & Fuel System | $531.90 |
| Misc | $447.99 |
| Tools | $73.72 |

*Lower Internals totalled `#REF!` in the source sheet — those figures survive per-line in
`as-built-engine-specs.md` and the register.*
