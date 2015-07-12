##
# This is a state intended to be run by hand anytime you need to restore your
# original xorg.conf.
##

restore-original-xorg-conf:
  cmd.run:
    - name: cp /home/{{ salt.pillar.get('user-config:username') }}/{{ salt.pillar.get('kosher:data-directory') }}/x11/xorg.conf.orig /etc/X11/xorg.conf
