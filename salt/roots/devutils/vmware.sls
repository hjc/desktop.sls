# @TODO: Actually investigate this and make sure it properly works
vmware:
  pkg.installed:
    - pkgs:
      - open-vm-tools
      - vmware-manager