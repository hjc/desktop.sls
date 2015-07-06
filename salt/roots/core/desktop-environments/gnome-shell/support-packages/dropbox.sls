nautilus-dropbox:
  pkg.installed:
    - pkgs:
      - nautilus-dropbox
    - require-in:
      - dropbox
    # on Debian, the source added from core.pkg-sources to get Dropbox will cause
    # the nautilus-dropbox extension to clash with a version it provides,
    # fix that.
    {% if grains['os'] == 'Debian' %}
    - fromrepo: {{ grains['lsb_distrib_codename'] }}
    {% endif %}
