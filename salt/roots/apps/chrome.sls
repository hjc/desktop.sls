include:
  - core.pkg-sources.sources.google-chrome

# if you don't install these first, you can hit dependency issues with Chrome
chrome-support-pkgs:
  pkg.latest:
    - pkgs:
      - pepperflashplugin-nonfree
      - chromedriver
      - chromium
      - libappindicator1

# Package is provided by a PPA in core.pkg-sources
google-chrome-stable:
  # even though Chrome is *pretty* good at self-updating, we just updated
  # support packages, so we should update the main one too!
  pkg.latest:
    - require:
      - pkg: chrome-support-pkgs

set-chrome-as-default-browser:
  cmd.wait:
    - name: update-alternatives --set x-www-browser `which google-chrome-stable`
    - unless: 'update-alternatives --query x-www-browser | grep "Value: `which google-chrome-stable`"'
    # hardcode the shell in case the user uses some odd shell (e.g., fish, like
    # me!)
    - shell: /bin/sh
    - watch:
      - pkg: google-chrome-stable
