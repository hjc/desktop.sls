include:
  - devutils

git-nano-default-editor:
  cmd.run:
    # if the username isn't set, this would run as root anyway
    - name: git config --global core.editor "/usr/bin/env nano"
    - unless: git config --global core.editor | grep "/usr/bin/env nano"
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}
    # nano may as well be a GNU coreutil, so this has no require....
    - require:
      # require git
      - pkg: devpkgs
