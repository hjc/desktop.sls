include:
  - termutils

git-vim-default-editor:
  cmd.run:
    # if the username isn't set, this would run as root anyway
    - name: git config --global core.editor "/usr/bin/env vim"
    - unless: git config --global core.editor | grep "/usr/bin/env vim"
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}
    - require:
      - pkg: termpkgs