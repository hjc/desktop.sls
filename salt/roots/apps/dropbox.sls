include:
  - core.pkg-sources.sources.dropbox
  # @TODO: Figure out a better way to manage these app hooks so that any DE can register
  # any package and go
  {% if salt['pillar.get']('apps:desktop-environment:name') %}
  - apps.desktop-environments.{{ salt['pillar.get']('apps:desktop-environment:name') }}.support-packages.dropbox
  {% endif %}

dropbox:
  pkg.installed
