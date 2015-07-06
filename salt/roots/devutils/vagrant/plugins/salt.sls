vagrant-plugin-install-salt:
  cmd.run:
    - name: vagrant plugin install vagrant-salt
    - unless: vagrant plugin list | grep vagrant-salt
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}