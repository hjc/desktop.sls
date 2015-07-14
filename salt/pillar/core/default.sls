##
# This is the top level namespace for all keys that are used to configure
# Kosher's internal workings and structure.
#
# :role: namespace
# :type: dict
##
kosher:
  ##
  # Path to Kosher's storage directory. Kosher uses this to store back ups of
  # original files, and to dump data found during install.
  #
  # This is ALWAYS relative to the home user's directory.
  #
  # Should not have leading or trailing slash.
  #
  # :type: string
  # :example: `data-directory: .config/kosher`
  ##
  data-directory: .config/kosher
  ##
  # Which custom Linux kernel should be installed and managed for the system.
  #
  # Right now, only Liquorix and the 4.x branch of Linux are supported.
  #
  # Pass in `stock` to leave your kernel alone.
  #
  # :type: string
  # :values: stock|liquorix|4.0
  ##
  kernel: stock
