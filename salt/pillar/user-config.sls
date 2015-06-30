include:
  - user-config.hjc1710

user-config:
  full-name: {{ salt['pillar.get']('user-config:first-name') }} {{ salt['pillar.get']('user-config:last-name') }}