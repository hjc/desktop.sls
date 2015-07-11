include:
  - core.sysmanagement.user-in-sudo
  - devutils.{{ salt['pillar.get']('devutils:vagrant:provider', 'virtualbox') }}
  {% for provider in salt['pillar.get']('devutils:vagrant:alternative-providers', []) %}
  - devutils.{{ provider }}
  {% endfor %}

vagrant:
  pkg.latest
