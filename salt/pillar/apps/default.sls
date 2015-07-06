apps:
  ##
  # The top level namespace for all configuration options related to setting
  # a desktop environment.
  #
  # :type: dict
  # :role: namespace
  ##
  desktop-environment:
    ##
    # The name of the primary desktop environment to install. This is also used
    # to determine which support states to run for more primary states, e.g.,
    # run nautilus-dropbox if cinnamon is the default DE.
    #
    # Currently, only cinnamon and gnome shell are supported. Use False for no
    # DE.
    #
    # :type: string|None
    # :values: cinnamon|gnome-shell|False
    ##
    name: cinnamon
    ##
    # Options specific to the dekstop environment indicating additional states
    # to install or options to configure with.
    ##
    options:
