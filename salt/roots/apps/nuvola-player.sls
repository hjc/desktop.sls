include:
  - core.pkg-sources.sources.tiliado

nuvola-player:
  pkg.latest:
    - pkgs:
      - nuvolaplayer3
      - nuvolaplayer3-all-services

# if nuvola player adds new services, DPKG will not reconfigure them, which
# adds them to things like the Cinnamon start menu, so we watch that
reconfigure-nuvola-player:
  cmd.watch:
    - name: dpkg-reconfigure nuvolaplayer3-all-services
    - watch:
      - pkg: nuvola-player
