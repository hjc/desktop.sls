include:
  - core.pass
  {% if salt.pillar.get('kosher:kernel') == '4.0%}
  {% endif %}
  {% if salt.pillar.get('kosher:kernel') == 'liquorix' %}
  - core.sysutils.kernels.liquorix
  {% endif %}
