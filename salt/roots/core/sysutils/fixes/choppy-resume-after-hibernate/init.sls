/etc/pm/sleep.d/10_ht.sh:
  file.managed:
    - source: salt://core/sysutils/fixes/choppy-resume-after-hibernate/10_ht.sh
    - mode: 755
    - owner: root
    - group: root
