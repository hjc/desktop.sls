yarn-ppa:
  pkgrepo.managed:
    - name: deb https://dl.yarnpkg.com/debian/ stable main
    - humanname: Yarn
    - dist: stable
    - file: /etc/apt/sources.list.d/yarn-pkg.list
    - gpgcheck: 1
    - key_url: https://dl.yarnpkg.com/debian/pubkey.gpg
