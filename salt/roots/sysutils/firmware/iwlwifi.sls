{% if grains['os'] == 'Debian' %}
include:
  - apt-sources/debian-nonfree
{% endif %}

firmware-iwlwifi:
  pkg.installed