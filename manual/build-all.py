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
         "build-toc.py", "build-binder.py", "build-colorsplit.py"]
for i, s in enumerate(STEPS, 1):
    print(f"[{i}/{len(STEPS)}] {s}")
    r = subprocess.run([sys.executable, os.path.join(HERE, s)])
    if r.returncode: sys.exit(f"FAILED: {s}")
# A silently clipped trap is worse than no trap, so fail the build on overflow.
chk = os.path.join(os.path.dirname(HERE), "tools", "check-overflow.py")
print("[check] overflow")
if subprocess.run([sys.executable, chk]).returncode:
    sys.exit("FAILED: generated text runs off the page")
print("\nbinder complete")
