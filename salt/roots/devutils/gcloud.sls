gcloud-ppa:
  pkgrepo.managed:
    - humanname: gcloud SDK
    - name: deb https://packages.cloud.google.com/apt cloud-sdk-{{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/google-cloud-sdk.list
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg

gcloud:
  pkg.installed:
    - pkgs:
      - google-cloud-sdk
      - google-cloud-sdk-app-engine-python
    - require:
      - pkgrepo: gcloud-ppa
