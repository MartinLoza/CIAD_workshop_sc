# CIAD single-cell workshop — base setup
#
# Sourced at the top of notebooks 00, 01 and 02:
#
#   source("https://raw.githubusercontent.com/MartinLoza/CIAD_workshop_sc/main/setup/setup.R")
#
# Notebook 03 needs Canek as well, which costs several extra minutes, so it
# sources setup_canek.R instead. Do not add Canek here — the point of the split
# is that notebooks which do not use it do not wait for it.
#
# Safe to run more than once. If the runtime disconnects, run the cell again;
# anything already installed is skipped.
#
# Measured on Colab, 2026-09 (R 4.6.1, Ubuntu 22.04.5 jammy). No pre-built
# tarball is involved — every package below arrives as a binary.

# ---------------------------------------------------------------- what we need

.ciad_apt  <- c("libglpk40")   # igraph loads against GLPK; Colab lacks it

.ciad_cran <- c("Seurat", "harmony", "patchwork", "dplyr", "ggplot2", "hdf5r")
# Packages with Bioconductor dependencies are opt-in: they cost extra time, and
# most notebooks do not use them. The setup_*.R wrappers set these flags before
# sourcing this file; nothing else should.
.ciad_bioc <- c(
  # Canek: pulls bluster, BiocNeighbors, S4Vectors, BiocParallel
  if (isTRUE(get0(".ciad_want_canek",   ifnotfound = FALSE))) "Canek",
  # glmGamPoi: makes SCTransform fast. Pulls DelayedArray, HDF5Array, beachmat
  if (isTRUE(get0(".ciad_want_spatial", ifnotfound = FALSE))) "glmGamPoi"
)
.ciad_gh   <- c(presto = "immunogenomics/presto")   # not on CRAN; compiles

# --------------------------------------------------------------- where from

# Both repositories are keyed to the runtime's Ubuntu release, R version and
# architecture, so they follow Colab if Google reimages the machine rather than
# breaking silently.
.ciad_os <- function(key, default = NA_character_) {
  line <- grep(paste0("^", key, "="), readLines("/etc/os-release"), value = TRUE)
  if (!length(line)) return(default)
  gsub("\"", "", sub("^[^=]+=", "", line[1]))
}

.ciad_repos <- function() {
  codename <- .ciad_os("VERSION_CODENAME")
  rver     <- paste(R.version$major, strsplit(R.version$minor, ".", TRUE)[[1]][1], sep = ".")
  arch     <- R.version$arch

  c(
    # Bioconductor: r-universe publishes Linux binaries, bioconductor.org does not.
    # No "/src/contrib" here — R appends it itself via contrib.url().
    BIOC = sprintf("https://bioc.r-universe.dev/bin/linux/%s-%s/%s",
                   codename, arch, rver),
    # CRAN: Posit Public Package Manager, binaries chosen by Ubuntu release
    CRAN = sprintf("https://packagemanager.posit.co/cran/__linux__/%s/latest",
                   codename)
  )
}

# ------------------------------------------------------------------- install

.ciad_missing <- function(pkgs) pkgs[!vapply(pkgs, requireNamespace, logical(1),
                                             quietly = TRUE)]

.ciad_setup <- function(quiet = TRUE) {
  t0 <- Sys.time()

  options(
    repos         = .ciad_repos(),
    Ncpus         = max(1L, parallel::detectCores()),
    # P3M decides what to serve partly from the user agent
    HTTPUserAgent = sprintf("R/%s R (%s)", getRversion(),
                            paste(getRversion(), R.version$platform,
                                  R.version$arch, R.version$os))
  )

  # system libraries — quiet, because apt prints alarming but harmless
  # ldconfig warnings about Colab's own libraries
  invisible(system(paste("apt-get install -y -qq",
                         paste(.ciad_apt, collapse = " "), "> /dev/null 2>&1")))

  need <- .ciad_missing(c(.ciad_cran, .ciad_bioc))
  if (length(need)) {
    message("installing: ", paste(need, collapse = ", "))
    install.packages(need, quiet = quiet)
  }

  # presto is GitHub-only and must be compiled (~30 s). It only makes
  # FindAllMarkers faster, so a failure here is not fatal.
  for (p in names(.ciad_gh)) {
    if (!requireNamespace(p, quietly = TRUE)) {
      message("installing: ", p, " (from GitHub, compiles)")
      if (!requireNamespace("remotes", quietly = TRUE))
        install.packages("remotes", quiet = quiet)
      try(remotes::install_github(.ciad_gh[[p]], upgrade = "never",
                                  quiet = quiet), silent = TRUE)
    }
  }

  suppressPackageStartupMessages({
    library(Seurat)
    library(ggplot2)
    library(dplyr)
    library(patchwork)
  })

  options(repr.plot.width = 10, repr.plot.height = 7)

  .ciad_report(round(as.numeric(difftime(Sys.time(), t0, units = "secs"))))
}

# -------------------------------------------------------------------- report

.ciad_report <- function(secs) {
  wanted <- c(.ciad_cran, .ciad_bioc, names(.ciad_gh))
  ok     <- vapply(wanted, requireNamespace, logical(1), quietly = TRUE)

  cat("\n")
  for (p in wanted) {
    cat(sprintf("  %-12s %s\n", p,
                if (ok[[p]]) as.character(packageVersion(p)) else "MISSING"))
  }
  cat(sprintf("\n  ready in %d seconds\n", secs))

  hard <- setdiff(wanted, names(.ciad_gh))          # presto is optional
  if (all(ok[hard])) {
    cat("  ✅ setup complete\n\n")
    if (!ok[["presto"]])
      cat("  (presto unavailable — marker detection will be slower, ",
          "nothing else changes)\n\n", sep = "")
  } else {
    cat("\n  ❌ setup FAILED for:",
        paste(hard[!ok[hard]], collapse = ", "), "\n")
    cat("  Tell the instructor, and paste the messages above.\n")
    cat("  Meanwhile: Runtime → Disconnect and delete runtime, then run",
        "this cell again.\n\n")
  }

  invisible(all(ok[hard]))
}

.ciad_setup()
