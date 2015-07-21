{% if salt.pillar.get('termutils:apps:terminator:config-location') %}
terminator-config-file:
  file.symlink:
    - name: /home/{{ salt.pillar.get('user-config:username', 'root') }}/.config/terminator/config
    - target: {{salt.pillar.get('termutils:apps:terminator:config-location', '/dev/null')}}
    - force: True
    - require:
      - pkg: terminator
{% endif %}

terminator:
  pkg.latest
