include:
  - core.kosher-data-directory
  - core.systools.apt-transport-https

nodesource-data-directory:
  file.directory:
    - name: /home/{{ salt.pillar.get('user-config:username') }}/{{ salt.pillar.get('kosher:data-directory') }}/nodesource/
    - makedirs: True
    - owner: {{ salt.pillar.get('user-config:username') }}
    - group: {{ salt.pillar.get('user-config:username') }}
    - mode: 755
    - require:
      - file: kosher-data-directory

nodesource-install-script:
  file.managed:
    - name: /home/{{ salt.pillar.get('user-config:username') }}/{{ salt.pillar.get('kosher:data-directory') }}/nodesource/install.sh
    - source: salt://core/pkg-sources/sources/nodesource/install.sh
    - owner: {{ salt.pillar.get('user-config:username') }}
    - group: {{ salt.pillar.get('user-config:username') }}
    - mode: 744
    - template: jinja
    - require:
      - file: nodesource-data-directory

nodesource-key:
  cmd.run:
    - name: "curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -"
    - unless: "apt-key list | grep 68576280"
    - order: 1

# *sigh* the joyent team thinks they're special and are apparently too good for
# lanuchpad or anything normal, so there's this madness install script that does
# what apt-add-repository has been doing for years...
nodesource-ppa:
  cmd.run:
    - name: bash /home/{{ salt.pillar.get('user-config:username') }}/{{ salt.pillar.get('kosher:data-directory') }}/nodesource/install.sh
    - unless: test -f /home/{{ salt.pillar.get('user-config:username', 'root') }}/{{ salt.pillar.get('kosher:data-directory') }}/nodesource/installed
    - require:
      - cmd: nodesource-key
      - file: nodesource-install-script
      - pkg: apt-transport-https
    - require-in:
      - pkg: nodejs
