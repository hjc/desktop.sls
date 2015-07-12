kosher-data-directory:
  file.directory:
    - name: /home/{{ salt.pillar.get('user-config:username', 'root') }}/{{ salt.pillar.get('kosher:data-directory', '.config/kosher') }}
    - makedirs: True
    - user: {{ salt.pillar.get('user-config:username', 'root') }}
    - group: {{ salt.pillar.get('user-config:username', 'root') }}
    - dir_mode: 755
