#!/usr/bin/env python3
"""Build the whole binder in the right order, twice where it matters.

The contents page prints absolute page numbers for WRX-BINDER.pdf, and the
binder's page count depends on the contents page - so the last two steps run
a second time to converge. Skipping that leaves the BINDER column stale.
"""
import subprocess, sys, os
HERE = os.path.dirname(os.path.abspath(__file__))
STEPS = ["build-manual.py", "build-readfirst.py", "build-fluids.py",
         "build-aswired.py", "build-toc.py", "build-binder.py",
         "build-toc.py", "build-binder.py"]
for i, s in enumerate(STEPS, 1):
    print(f"[{i}/{len(STEPS)}] {s}")
    r = subprocess.run([sys.executable, os.path.join(HERE, s)])
    if r.returncode: sys.exit(f"FAILED: {s}")
print("\nbinder complete")
