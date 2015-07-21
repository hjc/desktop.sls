{% if grains['os'] == 'Ubuntu' %}
fprint-ppa:
  pkgrepo.managed:
    - ppa: fingerprint/fprint
    - require-in:
      - pkg: libpam-fprintd
{% endif %}

##
# Use fprintd-enroll or fprint_demo to enter your fingerprints.
##
libpam-fprintd:
  pkg.latest:
    - pkgs:
      - libpam-fprintd
      - libfprint-dev
      - fprint-demo
      - fprintd
