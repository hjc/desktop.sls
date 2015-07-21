{% set default_web_server = salt.pillar.get('devutils:php:default-webserver') %}

include:
  - core.pass
  {% if default_web_server == 'nginx' %}
  - devutils.nginx
  {% elif default_web_server == 'apache' %}
  - devutils.apache2
  {% endif %}

php5:
  pkg.latest:
    - pkgs:
      - php5-cgi
      - php5
      {% if default_web_server == 'nginx' %}
      - php5-fpm
      {% elif default_web_server == 'apache' %}
      - libapache2-mod-php5
      {% endif %}
