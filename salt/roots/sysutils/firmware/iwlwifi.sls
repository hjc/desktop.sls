{% if grains['os'] == 'Debian' %}
include:
  - core.pkg-sources.sources.debian-nonfree
{% endif %}

firmware-iwlwifi:
  pkg.installed
