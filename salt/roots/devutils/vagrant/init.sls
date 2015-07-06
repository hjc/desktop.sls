vagrant:
  pkg.latest

include:
  - devutils.{{ salt['pillar.get']('devutils:vagrant:provider', 'virtualbox') }}
  {% for provider in salt['pillar.get']('devutils:vagrant:alternative-providers', []) %}
  - devutils.{{ provider }}
  {% endfor %}