# CIAD single-cell workshop

Single-cell RNA-seq analysis in **R with Seurat v5**. One hour of lecture, three
hours hands-on.

You do not need to install anything. Everything runs in your browser on Google
Colab. You need a Google account and nothing else.

## Start here

| Notebook | What it is | Open |
|---|---|---|
| **00 — Hello** | 30-second check that Colab works for you. **Run this before the workshop day.** | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/00_hello.ipynb) |
| **01 — Inside a Seurat object** | What the object holds and how to get things out of it. ~30 min. | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/01_seurat_object.ipynb) |
| **02 — QC and clustering** | From raw counts to named cell types. PBMC 3k. ~60 min. | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/02_qc_and_clustering.ipynb) |
| **03 — Integration** | Two datasets, one batch effect. Seurat CCA, Harmony and Canek compared. ~60 min. | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/03_integration.ipynb) |
| **04 — Spatial** | Visium mouse brain. Clustering that recovers anatomy. ~30 min. | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/04_spatial.ipynb) |

More notebooks appear here as the workshop material is finished.

## Lecture slides

The slides from the first hour, the theory part, are here:
[presentation/CIAD_lecture_single_cell.pdf](presentation/CIAD_lecture_single_cell.pdf).
You can read them again after the workshop.

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
notebooks/es/   older Spanish drafts, paused (see below)
presentation/   the lecture slides, in PDF
setup/          the shared install code the notebooks load
src/            helper scripts
data/           small data files
docs/           instructor notes
```

`notebooks/es/` holds Spanish drafts of notebooks 00–03. They are **paused and
out of date** while the English notebooks are still changing, so they are not
linked above. They will be rebuilt from the English versions once those settle.
`python3 src/check_translations.py` checks that a Spanish notebook's code cells
are byte-identical to the English original; it will report differences until the
rebuild happens.

## License

MIT — see [LICENSE](LICENSE).
