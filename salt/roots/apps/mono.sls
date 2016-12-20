mono-devel:
  pkg.latest

mono-complete:
  pkg.latest:
    - require:
      - pkg: mono-devel
