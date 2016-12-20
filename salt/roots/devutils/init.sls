devpkgs:
  pkg.latest:
    - pkgs:
      - bindfs
      - gnupg-agent
      - openvpn
      - {{ pillar['packages']['git'] }}
