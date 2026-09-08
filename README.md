# CIAD single-cell workshop

Single-cell RNA-seq analysis in **R with Seurat v5**. One hour of lecture, three
hours hands-on.

You do not need to install anything. Everything runs in your browser on Google
Colab. You need a Google account and nothing else.

## Start here

| Notebook | What it is | English | Español |
|---|---|---|---|
| **00 — Hello** | 30-second check that Colab works for you. **Run this before the workshop day.** | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/00_hello.ipynb) | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/es/00_hello.ipynb) |
| **01 — Inside a Seurat object** | What the object holds and how to get things out of it. ~30 min. | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/01_seurat_object.ipynb) | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/es/01_seurat_object.ipynb) |
| **02 — QC and clustering** | From raw counts to named cell types. PBMC 3k. ~60 min. | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/02_qc_and_clustering.ipynb) | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/es/02_qc_and_clustering.ipynb) |
| **03 — Integration** | Two datasets, one batch effect. Seurat CCA, Harmony and Canek compared. ~60 min. | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/03_integration.ipynb) | [![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/es/03_integration.ipynb) |
| **04 — Spatial** | Visium mouse brain. Clustering that recovers anatomy. ~30 min. | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/04_spatial.ipynb) | — |

Both columns are the **same notebook** — same code, same order, same exercises.
Only the explanations differ. Pick whichever you read faster, and switch between
them whenever you like.

Ambas columnas son el **mismo notebook** — mismo código, mismo orden, mismos
ejercicios. Solo cambian las explicaciones. Usa la que leas más rápido.

More notebooks appear here as the workshop material is finished.

## How this works

Clicking a badge above opens the notebook in Google Colab. Colab gives you a
temporary Linux machine in a Google data centre and runs the code there, not on
your laptop.

Two things follow from that:

- **Your edits are yours alone.** Nothing you type goes back to this repository.
  To keep your work, use *File → Save a copy in Drive*.
- **The machine is temporary.** When the runtime shuts down, everything installed
  on it is gone. Reopening the link gives you a fresh one.

Each notebook is self-contained: it installs what it needs and downloads its own
data. You can start from any of them.

## Trouble

If a notebook fails **before** the workshop, send the error to the instructor.
If it fails **on the day**, say so — there is a recovery cell in each notebook
that lets you rejoin without redoing the earlier steps.

## Repository layout

```
notebooks/      the notebooks you open in Colab
notebooks/es/   the same notebooks, in Spanish
setup/          the shared install code the notebooks load
src/            helper scripts
data/           small data files
docs/           instructor notes
```

The Spanish notebooks are translations of the prose only — every code cell is
byte-identical to its English original. `python3 src/check_translations.py`
verifies that, and should be run before pushing a change to any notebook.

## License

MIT — see [LICENSE](LICENSE).
