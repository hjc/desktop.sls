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
    # :type: string|False
    # :values: cinnamon|gnome-shell|False
    ##
    name: cinnamon
    ##
    # Options specific to the dekstop environment indicating additional states
    # to install or options to configure with.
    ##
    options:
  ##
  # Top level namespace for all configuration options regarding the KeePass 2
  # package.
  #
  # :type: dict
  # :role: namespace
  ##
  keepass:
    ##
    # The keyboard shortcut to bind to KeePass2's autotype functionality.
    #
    # This will automatically be consumed by the desktop-environments state in
    # the core module, and the appropriate way to set default keybindings based
    # on the chosen DE will be used. This normally involves dconf.
    #
    # Map:
    #  - <Primary> - ctrl key.
    #  - <Alt> - alt key.
    #  - <Shift> - shift key.
    #  - <Super> - Windows/Super/Meta key.
    #  - a - The 'a' key.
    #
    # Note: You may need to restart your DE to see this take effect.
    #
    # :type: string|False
    # :exaple: autotype-shortcut: '<Primary><Alt>a'  # maps to ctrl-alt-a
    ##
    autotype-shortcut: '<Primary><Alt>a'
