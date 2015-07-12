devpkgs:
  pkg.latest:
    - pkgs:
      - bindfs
      - gnupg-agent
      - {{ pillar['packages']['git'] }}
