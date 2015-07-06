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
  # Chrome self-updates, so no need for pkg.latest here
  pkg.installed:
    - require:
      - pkg: chrome-support-pkgs

set-chrome-as-default-browser:
  cmd.wait:
    - name: update-alternatives --set x-www-browser `which google-chrome-stable`
    - unless: 'update-alternatives --query x-www-browser | grep "Value: `which google-chrome-stable`"'
    - watch:
      - pkg: google-chrome-stable
