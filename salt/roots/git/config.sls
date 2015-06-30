git-user-name:
  cmd.run:
    # if the username isn't set, this would run as root anyway
    - name: su - "{{ salt['pillar.get']('user-config:username', 'root') }}" -c 'git config --global user.name "{{ salt['pillar.get']('user-config:full-name', '') }}"'
    - unless: su - "{{ salt['pillar.get']('user-config:username', 'root') }}" -c 'git config --global user.name'  | grep "{{ salt['pillar.get']('user-config:full-name', '') }}"

git-email:
  cmd.run:
    - name: su - "{{ salt['pillar.get']('user-config:username', 'root') }}" -c 'git config --global user.email "{{ salt['pillar.get']('user-config:email', '') }}"'
    - unless: su - "{{ salt['pillar.get']('user-config:username', 'root') }}" -c 'git config --global user.email' | grep "{{ salt['pillar.get']('user-config:email', '') }}"