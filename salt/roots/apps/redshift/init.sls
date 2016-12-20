redshift:
  pkg.latest:
    - require_in:
      - redshift-gtk

{% if salt.pillar.get('apps:redshift:use-redshift-gtk') %}
redshift-gtk:
  pkg.latest
{% endif %}

##
# This package provides easy and reliable geolocation for redshift.
##
geoclue-2.0:
  pkg.latest:
    - require-in:
      - redshift

##
# Set up the redshift systemd unit, which enables easy restarts and an
# auto-start.
##
$HOME/.config/systemd/user/redshift.service:
  file.managed:
    - name: /home/{{ salt['pillar.get']('user-config:username', 'root') }}/.config/systemd/user/redshift.service
    - source: salt://apps/redshift/config-files/redshift.service
    - owner: {{ salt['pillar.get']('user-config:username', 'root') }}
    - group: {{ salt['pillar.get']('user-config:username', 'root') }}
    - mode: 644
    - makedirs: True
    - template: jinja
    - require-in:
      - cmd: enable-redshift-user-service

##
# Create the redshift configuration file.
##
$HOME/.config/redshift.conf:
  file.managed:
    - name: /home/{{ salt['pillar.get']('user-config:username', 'root') }}/.config/redshift.conf
    - source: salt://apps/redshift/config-files/redshift.conf
    - owner: {{ salt['pillar.get']('user-config:username', 'root') }}
    - group: {{ salt['pillar.get']('user-config:username', 'root') }}
    - mode: 755
    - makedirs: True
    - template: jinja


##
# Configure geoclue
##
redshift-configure-geoclue:
  file.append:
    - name: /etc/geoclue/geoclue.conf
    - text: |
        [redshift]
        allowed=true
        system=false
        users=

##
# Turn the user level systemd unit on so it starts automatically.
#
# NOTE: With user level systemd, this is not active when you are on the login
# manager.
##
enable-redshift-user-service:
  cmd.run:
    - name: systemctl --user enable redshift.service
    - unless: systemctl --user --all | grep redshift | grep loaded
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}

restart-redshift-user-service:
  cmd.wait:
    - name: systemctl --user restart redshift.service
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}
    - stateful: True
    - watch:
      - file: $HOME/.config/redshift.conf
