keepass2:
  pkg.latest

{% if salt.pillar.get('apps:keepass:enable-autolaunch-service') %}
##
# Set up the redshift systemd unit, which enables easy restarts and an
# auto-start.
##
$HOME/.config/systemd/user/keepass2.service:
  file.managed:
    - name: /home/{{ salt['pillar.get']('user-config:username', 'root') }}/.config/systemd/user/keepass2.service
    - source: salt://apps/keepass2/config-files/keepass2.service
    - owner: {{ salt['pillar.get']('user-config:username', 'root') }}
    - group: {{ salt['pillar.get']('user-config:username', 'root') }}
    - mode: 644
    - makedirs: True
    - template: jinja
    - require-in:
      - cmd: enable-keepass2-user-service

##
# Turn the user level systemd unit on so it starts automatically.
##
enable-keepass2-user-service:
  cmd.run:
    - name: systemctl --user enable keepass2.service
    - unless: systemctl --user --all | grep keepass2| grep loaded
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}
{% endif %}
