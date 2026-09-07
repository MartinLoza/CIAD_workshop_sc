# CIAD single-cell workshop — setup for the integration notebook
#
# Sourced at the top of notebook 03:
#
#   source("https://raw.githubusercontent.com/MartinLoza/CIAD_workshop_sc/main/setup/setup_canek.R")
#
# Everything in setup.R, plus Canek.
#
# Canek is on CRAN and arrives as a binary, but it imports bluster, which is a
# Bioconductor package — and Bioconductor publishes no Linux binaries of its own.
# Those dependencies come from r-universe instead (see .ciad_repos in setup.R).
# Expect this to take noticeably longer than the base setup.
#
# Notebooks that do not use Canek should source setup.R directly and not wait
# for any of this.

.ciad_want_canek <- TRUE

source("https://raw.githubusercontent.com/MartinLoza/CIAD_workshop_sc/main/setup/setup.R")

suppressPackageStartupMessages(library(Canek))
