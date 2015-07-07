##
# A collection of packages that desktop.sls needs for various scripting and
# shell purposes, if it is to run in the first place.
#
# This module automatically installs a number of system utilities we go on to
# use for scripting later on, such as a mutli-line friendly grep, and a keymap
# tool.
##
include:
  # multiline grep can be clutch
  - core.systools.pcregrep
  - core.systools.xdotool
