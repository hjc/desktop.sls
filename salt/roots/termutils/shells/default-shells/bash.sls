make-bash-default-shell:
  cmd.run:
    # please don't accidentally break the root shell
    - name: chsh -s /bin/bash "{{ salt['pillar.get']('user-config:username', 'nouname') }}"
    - unless: grep -e "^{{ salt['pillar.get']('user-config:username', 'nouname') }}" /etc/passwd | cut -d':' -f7 | grep -e "^/bin/bash"