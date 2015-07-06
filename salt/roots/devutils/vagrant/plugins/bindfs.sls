vagrant-plugin-install-bindfs:
  cmd.run:
    - name: vagrant plugin install vagrant-bindfs
    - unless: vagrant plugin list | grep vagrant-bindfs
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}