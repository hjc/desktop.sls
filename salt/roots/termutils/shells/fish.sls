fish:
  pkg.latest

add-fish-to-/etc/shells:
  cmd.wait:
    - name: echo "/usr/bin/fish" > /etc/shells
    - unless: grep "/usr/bin/fish" /etc/shells
    - watch:
      - pkg: fish