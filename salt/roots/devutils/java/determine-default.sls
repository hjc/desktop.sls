# Determine the default JDK to include and use it

{% set default_jdk = salt.pillar.get('devutils:default-jdk', 'oracle') %}

include:
  {% if default_jdk == 'oracle' %}
  - devutils/java/oracle-jdk
  {% elif default_jdk == 'open-jdk' %}
  - devutils/java/open-jdk
  {% else %}
  # add an explicit else just to future proof things
  - devutils/java/open-jdk
  {% endif %}
