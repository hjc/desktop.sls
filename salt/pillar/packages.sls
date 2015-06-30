include:
  {% if grains['os'] == 'RedHat' %}
  - packages.redhat
  {% elif grains['os'] == 'Debian' %}
  - packages/debian
  {% else %}
  # meh, works for now
  - packages.debian
  {% endif %}