# CIAD single-cell workshop — setup for the spatial notebook
#
# Sourced at the top of notebook 04:
#
#   source("https://raw.githubusercontent.com/MartinLoza/CIAD_workshop_sc/main/setup/setup_spatial.R")
#
# Everything in setup.R, plus glmGamPoi.
#
# glmGamPoi is a Bioconductor package that makes SCTransform substantially
# faster. The spatial vignette normalises with SCTransform, so it earns its place
# here — but nowhere else in the workshop, which is why it is not in setup.R.
#
# Reading the h5 counts matrix needs hdf5r, which setup.R already installs.

.ciad_want_spatial <- TRUE

source("https://raw.githubusercontent.com/MartinLoza/CIAD_workshop_sc/main/setup/setup.R")
