{% set default_de = salt.pillar.get('apps:desktop-environment:name') %}

include:
  - core.pass
{% if default_de == 'cinnamon' %}
  - apps.desktop-environments.cinnamon
{% elif default_de == 'gnome-shell' %}
  - apps.desktop-environments.gnome-shell
{% endif %}
