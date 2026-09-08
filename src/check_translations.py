#!/usr/bin/env python3
"""Check that each Spanish notebook still matches its English original.

The two versions differ in prose and nowhere else: every code cell must be
byte-identical, in the same order. Markdown cells may say anything.

This exists because the real risk with a translated copy is not a bad
translation, it is drift — a fix landing in one version and not the other, so
the students who most need the Spanish notebook get the stale one.

    python3 src/check_translations.py

Exits non-zero if any pair has diverged, so it can be used as a pre-push check.
"""

import json
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
EN = ROOT / "notebooks"
ES = EN / "es"


def code_cells(path):
    nb = json.loads(path.read_text())
    return [
        (c.get("id", ""), "".join(c["source"]))
        for c in nb["cells"]
        if c["cell_type"] == "code"
    ]


def check(en_path, es_path):
    """Return a list of problems, empty if the pair is consistent."""
    en, es = code_cells(en_path), code_cells(es_path)
    problems = []

    if len(en) != len(es):
        problems.append(
            f"different number of code cells: {len(en)} in English, {len(es)} in Spanish"
        )

    for i, (a, b) in enumerate(zip(en, es)):
        if a[1] != b[1]:
            problems.append(
                f"code cell {i + 1} differs (id {a[0]!r} vs {b[0]!r})\n"
                f"      English: {a[1].strip().splitlines()[0][:60]}\n"
                f"      Spanish: {b[1].strip().splitlines()[0][:60]}"
            )

    return problems


def main():
    if not ES.is_dir():
        print("no notebooks/es directory — nothing to check")
        return 0

    pairs = sorted(ES.glob("*.ipynb"))
    if not pairs:
        print("no Spanish notebooks found")
        return 0

    failed = 0
    for es_path in pairs:
        en_path = EN / es_path.name
        if not en_path.exists():
            print(f"FAIL {es_path.name}: no English original at {en_path}")
            failed += 1
            continue

        problems = check(en_path, es_path)
        if problems:
            failed += 1
            print(f"FAIL {es_path.name}")
            for p in problems:
                print(f"  - {p}")
        else:
            n = len(code_cells(en_path))
            print(f"ok   {es_path.name}  ({n} code cells identical)")

    untranslated = sorted(
        p.name for p in EN.glob("*.ipynb") if not (ES / p.name).exists()
    )
    if untranslated:
        print("\nno Spanish version (fine if deliberate): " + ", ".join(untranslated))

    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
