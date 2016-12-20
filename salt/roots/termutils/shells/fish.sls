fish:
  pkg.latest

add-fish-to-/etc/shells:
  cmd.run:
    - name: echo "/usr/bin/fish" >> /etc/shells
    - unless: grep "/usr/bin/fish" /etc/shells
