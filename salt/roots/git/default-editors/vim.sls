include:
  - termutils

git-vim-default-editor:
  cmd.run:
    # if the username isn't set, this would run as root anyway
    - name: su - "{{ salt['pillar.get']('user-config:username', 'root') }}" -c 'git config --global core.editor "/usr/bin/env vim"'
    - unless: su - "{{ salt['pillar.get']('user-config:username', 'root') }}" -c 'git config --global core.editor' | grep "/usr/bin/env vim"
    - require:
      - pkg: termpkgs