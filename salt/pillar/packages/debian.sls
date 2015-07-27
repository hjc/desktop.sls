packages:
  {% if grains['os'] == 'Ubuntu' %}
  git: git-core
  {% else %}
  git: git
  {% endif %}
  apache: apache2
