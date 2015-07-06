include:
  - apt-sources

# if you don't install these first, you can hit dependency issues with Chrome
chrome-support-pkgs:
  pkg.latest:
    - pkgs:
      - pepperflashplugin-nonfree
      - chromedriver
      - chromium
      - libappindicator1

# Package is provided by a PPA in apt-sources
chrome-pkg:
  # Chrome self-updates, so no need for pkg.latest here
  pkg.installed:
    - pkgs:
      - google-chrome-stable
    - require:
      - file: google-chrome-source
      - pkg: chrome-support-pkgs

set-chrome-as-default-browser:
  cmd.wait:
    - name: update-alternatives --set x-www-browser /usr/bin/google-chrome-stable
    - watch:
      - pkg: chrome-pkg
