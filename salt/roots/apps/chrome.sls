include:
  - apt-sources

chrome-support-pkgs:
  pkg.installed:
    - pkgs:
      - pepperflashplugin-nonfree
      - chromedriver
      - chromium
      - libappindicator1

chrome-pkg:
  pkg.installed:
    - pkgs:
      - google-chrome-stable
    - require:
      - file: google-chrome-source
      - pkg: chrome-support-pkgs

set-chrome-as-default-browser:
  cmd.wait:
    - name: update-alternatives --set x-www-browser /usr/bin/google-chrome-stable
#    - unless: "update-alternatives --query x-www-browser | grep 'Value: /usr/bin/google-chrome-stable'"
    - watch:
      - pkg: chrome-pkg
