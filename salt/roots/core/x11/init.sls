include:
  - core.kosher-data-directory

# on first run, backup user's original xorg.conf file
create-x11-data-dir:
  file.directory:
    - name: /home/{{ salt.pillar.get('user-config:username', 'root') }}/{{ salt.pillar.get('kosher:data-directory') }}/x11
    - user: {{ salt.pillar.get('user-config:username', 'root') }}
    - group: {{ salt.pillar.get('user-config:username', 'root') }}
    - makedirs: True
    - require:
      - file: kosher-data-directory

backup-x11-conf:
  cmd.run:
    - name: cp /etc/X11/xorg.conf /home/{{ salt.pillar.get('user-config:username', 'root') }}/{{ salt.pillar.get('kosher:data-directory') }}/x11/xorg.conf.orig
    - unless: test -f /home/{{ salt.pillar.get('user-config:username', 'root') }}/{{ salt.pillar.get('kosher:data-directory') }}/x11/xorg.conf.orig
    - require:
      - file: create-x11-data-dir
