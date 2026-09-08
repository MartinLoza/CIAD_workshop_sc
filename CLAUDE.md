# CIAD single-cell workshop

## What this is

A 4-hour single-cell RNA-seq workshop: 1 hour lecture, 3 hours hands-on in R with
Seurat v5. Students have no local installation. Everything runs on Google Colab R
runtimes. Material is adapted from the official Seurat vignettes so students can
consult the originals afterwards.

Repo: https://github.com/MartinLoza/CIAD_workshop_sc (public)

The full original brief is in [docs/brief.md](docs/brief.md). Read it, but note that
some of its decisions were revised in discussion — see below.

## How to work with Martin

- Plain, flat language. Not casual, not full of jargon. Short.
- One topic at a time. Do not open several threads in one message.
- Discuss in prose. Do not use multiple-choice question tools; ask openly instead.
- Short answers. Do not write long explanations unless asked.
- Do one phase at a time and stop for review before moving on.
- Ask when something is ambiguous rather than guessing.

Background: Martin knows R and single-cell analysis and has used GitHub. He has not
used Google Colab before, and has not used a pre-built library tarball before.
Explain Colab-specific mechanics rather than assuming them.

## Division of labour

Claude runs locally in VS Code and **cannot** execute Colab cells, cannot verify that
R packages install, and cannot produce a tarball.

- **Claude does:** scaffold the repo, write notebooks and scripts, adapt vignette
  content, handle git, write the README and docs.
- **Martin does, in a browser:** run anything on Colab, produce and upload files,
  run the test pass.

Never claim a build or install step succeeded. When a step needs Martin, stop and say
exactly what to run and what output to paste back.

## Decisions made so far

1. **Colab is fixed** as the platform, regardless of how packages get installed.

2. **Start without the pre-built tarball.** The brief's plan was to build a tarball of
   the R library and host it on a GitHub release. Reasons for deferring it:
   - It only works on a machine matching the R and Ubuntu version it was built on.
     Google reimages Colab without notice, and then it fails for the whole room.
   - It is a build artifact Martin has to maintain and re-test before the workshop.
   - Martin has not used Colab before, so the simpler path should be working first.

   Plan: get the workshop running on a plain install path, measure the real time, and
   add the tarball later only if the saved minutes matter.

3. **Posit Package Manager (P3M) instead of r2u** for the plain install path. P3M
   serves pre-compiled Linux R binaries through normal `install.packages()`, chosen at
   install time by Ubuntu release and R version, so it survives a Colab image change.
   r2u installs R packages through Ubuntu's apt and expects a particular R build,
   which may not be Colab's — an invisible coupling that can break. This revises
   Phase 1 and Phase 3 of the brief.

   Not yet confirmed: whether P3M covers whatever Ubuntu/R combination Colab currently
   runs. Must be tested on Colab before committing to it.

4. **Public repository, plain GitHub.** No Colab-side integration exists or is needed.
   Colab reads notebooks over the web at:
   `https://colab.research.google.com/github/MartinLoza/CIAD_workshop_sc/blob/main/notebooks/NAME.ipynb`
   Students clicking that get their own temporary copy; their edits do not come back.
   Public matters: a private repo would make each of ~30 students authorise Colab
   against Martin's account.

## Correction to the brief

The brief worries about total download size being "quick on conference wifi". This is
mostly not a real constraint. Files are downloaded by the Colab virtual machine in a
Google data centre, not by the students' laptops. The laptops only receive the notebook
page. Size only matters for anything students download to their own computers.

## Things to verify, never write from memory

All of these drift and are past the knowledge cutoff. Look them up before writing code:

- Colab's current R version and Ubuntu release (**only Martin can get this**, by
  running one cell on Colab).
- Whether P3M publishes binaries for that Ubuntu/R combination, and the correct repo URL.
- Where `presto` currently lives — CRAN or GitHub. GitHub would add a compile step.
- The Seurat v5 `IntegrateLayers` signature and the current v5 integration workflow.
  v5 differs from v4 and deprecated calls must not go in front of students.
- Current source of the Seurat vignettes being adapted.

## Immediate next step

Ask Martin to run a first cell on a Colab R runtime reporting the R version and Ubuntu
release, since the install path depends on it. Nothing else is blocked on it, so the
repo scaffold (Phase 0 of the brief) can proceed in parallel.

## Repo conventions (from the brief, still current)

```
notebooks/   # .ipynb, R kernel
src/         # helper R scripts
data/        # small files only
docs/        # instructor notes
```

- Notebooks must declare the **R kernel** (`IRkernel`, language `R`), not Python. This
  is the most common thing to get wrong when writing `.ipynb` by hand — set it explicitly.
- Shell commands use `system()`, not `!`:
  `cat(system("cmd 2>&1", intern = TRUE), sep = "\n")`
- First code cell after setup: `options(repr.plot.width = 10, repr.plot.height = 7)`
- jupytext pairing, so each `.ipynb` has an `.Rmd` twin for readable diffs. Needs a
  `jupytext.toml`, and the README should explain how to keep them in sync.
