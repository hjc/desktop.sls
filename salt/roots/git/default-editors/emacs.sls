include:
  - devutils
  - termutils

git-emacs-default-editor:
  cmd.run:
    # if the username isn't set, this would run as root anyway
    - name: git config --global core.editor "/usr/bin/env emacs"
    - unless: git config --global core.editor | grep "/usr/bin/env emacs"
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}
    - require:
      - pkg: termpkgs
      # require git
      - pkg: devpkgs
