# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased][unreleased]
### Added
- Renamed to Kosher.
- Added a new required core state: create-data-directory. This makes a directory
for Kosher to dump all backups or any other files that need saving for later.
The default location for this is `.config/kosher`.
- Added new pillar data for configuring Kosher internals (such as the location
of the Kosher data directory).
- Added new required core state: x11. It will handle all X11 configuration.
- Made core.x11 state backup your original `xorg.conf`, just in case.
- Added a new auxiliary state for restoring your original `xorg.conf` to core.
Invoke with: `salt-call state.sls core.x11.restore-original-xorg-conf`.
- Redshift app now installs a user level service that auto-starts itself whenever
you log in.
- Redshift app now installs a config file to maintain itself. It is configured
via pillar data.
- Added states to stop and restart the Redshift service, since it is a user
service and not every might be familiar with that.
- Added a new section to the apps pillar config specifically for Redshift.
- Added a new package source to pkg-sources for nodesource. Has to use their
install script though.
- Added a state to explicitly reinstall the nodesource.
- Added apt-transport-https to systools (core, required).
- Add lsb-release as a core required systool.
- Base Gnome state in core.desktop-environments now installs gnome-tweak-tool.

### Changed
- Moved curl out of the devutils package and into core.systools.

### Fixed
- The KeePass2 Shortcut that gets bound is now correct.
- The gpointing-device-settings now syncs the proper conf file for a Thinkpad.
- node devutil package now requires proper nodesource, so it should come updated
with the latest (0.12).

## [0.2.0] - 2015-04-11
### Added
- Cinnamon state keeps Nemo and Muffin up to date.
- Gnome Shell as a desktop environment.
- Pillar data to configure apps in general.
- Pillar data to configure desktop environments, in the apps pillar data.
- This Changelog.
- System for determining the default selected DE based on pillar data and
installing it.
- Small system for adding support packages based on DE. Prototyped with
Dropbox for now.
- Support for setting the KeePass2 AutoType shortcut in Cinnamon 2.6+
using dconf.
- pcregrep is now a base package in systools.
- Support for installing ack-grep in devutils.
- Support for installing silversearcher-ag in devutils.
- htop is now a core systool.
- xclip is now a core systool.
- gpointing-device-settings is now a supported sysutil firmware. It comes
with a config file that works well for Thinkpads.
- New support for configuring your desired Linux Kernel in the core module.
See the core/default pillar for how to configure between stock, Liquorix,
and Linux 4.0.
- Support for adding and removing Liquorix.

### Changed
- Refactored sysmanagement into core.

## [0.1.1] - 2015-04-06
### Added
- New systools module to the core module, it will install all tools we need
for command line scripting
- Made xdotool get installed by default.
- Support for keepass2 in apps.
- Support for Dropbox in apps.

### Changed
- Fixed some require oddness that should not have been.

## [0.1.0] - 2015-04-06
### Added
- New core state. All top.sls files must include the core state as it sets up
all other states.
- New core.pass state. This is just an empty state that can be used to satisfy
YAML syntax.
- New system for determining a proper initial package sources file to use based
on distro name and release. This works automatically and makes it so things like Debian
non-free are included, Jessie backports are enabled, etc. Only Debian testing is currently
supported.
- Support for cinnamon to be installed as a DE in the apps section.
- Support for installing the following apps:
  1. Google Chrome
  2. JetBrains IntelliJ
  3. Sublime Text 3
  4. Oracle and Open JDK
  5. Terminator
  6. Vim
  7. Emacs
  8. Git
  9. Fish Shell
  10. Vagrant
  11. Virtualbox
  12. VMWare
  13. NFS
  14. SSH
  15. bindfs
  16. Latest Salt Stack
  17. GPG Agent
- Support for installing iwlwifi firmware.
- Misc. ways to configure git via pillar data.
- Support for setting default shells.
- Support for installing proper vagrant provider based on settings.

### Changed
- Moved the entire apt-sources module into core under the new pkg-sources name.
