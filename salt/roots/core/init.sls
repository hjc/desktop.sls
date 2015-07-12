##
# The core set of includes that desktop.sls needs to function.
#
# This should only contain top level includes of other core modules, let the
# init states in each module determine what else to include.
##

include:
  - core.create-data-directory
  - core.desktop-environments
  - core.pkg-sources
  - core.systools
  - core.x11

