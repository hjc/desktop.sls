include:
  - core.pkg-sources.sources.nodesource

remove-nodesource-installed-file:
  file.absent:
    - name: /home/{{ salt.pillar.get('user-config:username', 'root') }}/{{ salt.pillar.get('kosher:data-directory') }}/nodesource/installed
    - order: 2
