include:
  - devutils

git-user-name:
  cmd.run:
    # if the username isn't set, this would run as root anyway
    - name: git config --global user.name "{{ salt['pillar.get']('user-config:full-name', '') }}"
    - unless: git config --global user.name | grep "{{ salt['pillar.get']('user-config:full-name', '') }}"
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}
    - require:
      # require git
      - pkg: devpkgs

git-email:
  cmd.run:
    - name: git config --global user.email "{{ salt['pillar.get']('user-config:email', '') }}"
    - unless: git config --global user.email | grep "{{ salt['pillar.get']('user-config:email', '') }}"
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}
    - require:
      # require git
      - pkg: devpkgs