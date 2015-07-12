restart-redshift:
  cmd.run:
    - name: systemctl --user stop redshift.service
    - user: {{ salt.pillar.get('user-config:username') }}
