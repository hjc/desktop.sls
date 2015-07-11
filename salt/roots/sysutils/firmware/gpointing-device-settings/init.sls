/usr/share/X11/xorg.conf.d/20-thinkpad.conf:
  file.managed:
    - source: salt://sysutils/firmware/gpointing-device-settings/init.sls
    - mode: 644
    - owner: root
    - group: root
    - makedirs: True
    - dir_mode: 755

gpointing-device-settings:
  pkg.latest
