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
    ##
    # Should a user-level systemd unit be installed that automatically keeps
    # keepass2 running and auto-starts it?
    #
    # :type: bool
    ##
    enable-autolaunch-service: True
  ##
  # Top level namespace for all configurations regarding the redshift package
  # and service.
  #
  # Redshift is a more open-source and adaptable version of f.lux.
  #
  # :type: dict
  # :role: namespace
  ##
  redshift:
    ##
    # Should we use redshift-gtk? Using this should give you a system tray icon
    # that can be used to control redshift.
    #
    # :type: bool
    ##
    use-redshift-gtk: True
    ##
    # The screen temperature that should be used during the day.
    #
    # :type: int
    # :values: 1000-25000
    ##
    day-temperature: 5500
    ##
    # The screen temperature that should be used during the night.
    #
    # :type: int
    # :values: 1000-25000
    ##
    # @TODO: This should really be 3000 by default. But get a better
    # config system first.
    night-temperature: 3000
    ##
    # Should we show the screen transitioning between colors?
    #
    # :type: int
    # :values: 0|1
    ##
    use-transition: 1
    ##
    # Set the screen gamma (for all colors, or each color channel individually).
    #
    # :type: float|list[float]
    # :values: 0.0-1.0|0.0-1.0:0.0-1.0:0.0-1.0
    # :example: 0.8:0.5:0.6  # would customize red, green, and blue individually.
    ##
    gamma: 0.8
    ##
    # Which screens redshift should run on.
    #
    # You can use all to apply redshift to all screens. Otherwise, screen
    # numbering starts at zero.
    #
    # :type: int|string
    # :values: >=0|all
    ##
    screen: all
