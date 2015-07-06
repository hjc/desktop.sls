include:
  - core.pass
  {% if grains['os'] == 'Debian' %}
    {% if salt.pillar.get('distro:debian:is-sid', False) %}
  # @TODO: Create a package list for debian-sid
  - core.pkg-sources.distros.debian-sid
    {% elif grains['osrelease'] == 'testing' %}
  - core.pkg-sources.distros.debian-testing
    {% endif %}
  {% endif %}
