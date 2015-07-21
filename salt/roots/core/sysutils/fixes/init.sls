##
# This folder contains specific files and commands to fix various issues individuals
# have with their Linux setups, such as choppiness after resuming from hibernation.
##

{% set fixes = salt.pillar.get('kosher:sysutils:fixes:enabled-fixes', []) %}

include:
  - core.pass
  {% for fix in fixes %}
  - core.sysutils.fixes.{{ fix }}
  {% endfor %}
