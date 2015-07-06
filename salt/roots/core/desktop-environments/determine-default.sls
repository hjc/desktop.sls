{% set default_de = salt.pillar.get('apps:desktop-environment:name') %}

include:
  - core.pass
{% if default_de == 'cinnamon' %}
  - core.desktop-environments.cinnamon
{% elif default_de == 'gnome-shell' %}
  - core.desktop-environments.gnome-shell
{% endif %}
