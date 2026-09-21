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

## Feedback

Two short forms. Both are anonymous, and neither asks for your name or your
email address.

- [**Before we start**](https://docs.google.com/forms/d/e/1FAIpQLSfhIcgACzZQGgfSrqo8hhEPn5z05rpq0o0qOtPt-XWhYa-fhg/viewform) — answer this at the beginning of the session.
- [**Feedback**](https://docs.google.com/forms/d/e/1FAIpQLSdLjkeDfPcesFg7vdUEnBODmn16WTeeb92vvEXhTrwlgaEJzQ/viewform) — answer this at the end.

Both forms ask you for a short code. Use the same code in both, so we can
compare the two answers without knowing who you are.

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

## Versiones en español

The notebooks are also available in Spanish, for your convenience. The text is
translated. The code is the same code, line for line, so you can follow either
version.

Los notebooks también están en español. El texto está traducido. El código es el
mismo, línea por línea, así que puedes seguir cualquiera de las dos versiones.

| Notebook | Abrir |
|---|---|
| **00 — Hola, R en Colab** | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/es/00_hello.ipynb) |
| **01 — Dentro de un objeto Seurat** | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/es/01_seurat_object.ipynb) |
| **02 — Control de calidad, clustering y tipos celulares** | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/es/02_qc_and_clustering.ipynb) |
| **03 — Integrar dos conjuntos de datos** | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/es/03_integration.ipynb) |
| **04 — Transcriptómica espacial** | [![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/es/04_spatial.ipynb) |

## Repository layout

```
notebooks/      the notebooks you open in Colab
notebooks/es/   the same notebooks, in Spanish
presentation/   the lecture slides, in PDF
setup/          the shared install code the notebooks load
src/            helper scripts
data/           small data files
docs/           instructor notes
```

`python3 src/check_translations.py` checks that every code cell in a Spanish
notebook is byte-identical to the English original. Run it after editing any
notebook.

## License

MIT — see [LICENSE](LICENSE).
