{% if salt.pillar.get('termutils:apps:terminator:config-location') %}
terminator-config-dir:
  file.directory:
    - name: /home/{{ salt.pillar.get('user-config:username', 'root') }}/.config/terminator
    - user: {{ salt.pillar.get('user-config:username', 'root') }}
    - group: {{ salt.pillar.get('user-config:username', 'root') }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

terminator-config-file:
  file.symlink:
    - name: /home/{{ salt.pillar.get('user-config:username', 'root') }}/.config/terminator/config
    - target: {{salt.pillar.get('termutils:apps:terminator:config-location', '/dev/null')}}
    - force: True
    - require:
      - pkg: terminator
      - file: terminator-config-dir
{% endif %}

terminator:
  pkg.latest
