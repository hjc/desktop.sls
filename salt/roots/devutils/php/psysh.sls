include:
  - devutils.php.composer

composer g require psy/psysh:@stable:
  cmd.run:
    - require:
      - cmd: get-composer
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}
