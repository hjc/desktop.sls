# @TODO: Use me somewhere

##
# This file sets keybindings for KeePass2's AutoType for Cinnamon 2.6+/
#
# Any Cinnamon version below 2.6+ is untested.
##

include:
  - core.systools.pcregrep

{# The gsettings namespace for the keybinding (the dconf key) #}
{% set keybinding_namespace = 'org.cinnamon.desktop.keybindings.custom-keybindings' %}
{# The gsettings file path for the keybinding (the dconf path) #}
{% set keybinding_path = keybinding_namespace.replace('.', '/') %}

{# This will work for Debian, but not Arch or RedHat #}
{% set keepass_path = "`dpkg -L keepass2 | grep -e 'KeePass.exe$'`" %}

{# This will be our actual shortcut. In it <Primary> maps to ctrl #}
{% set autotype_shortcut = salt.pillar.get('apps:keepass:autotype-shortcut') %}

{% if autotype_shortcut %}
set-dconf-full-path:
  cmd.run:
    # We cannot use gsettings here due to a schema issue.
    - name: |
        cat << EOF | dconf load /org/cinnamon/desktop/keybindings/custom-keybindings/
        [org.cinnamon.desktop.keybindings.custom-keybinding.keepass2.autotype]
        binding=['{{ autotype_shortcut }}']
        command='mono {{ keepass_path }} --autotype'
        name='keepass2.autotype'
        EOF
    - unless: dconf dump /org/cinnamon/desktop/keybindings/custom-keybindings/org.cinnamon.desktop.keybindings.custom-keybinding.keepass2.autotype/ | pcregrep -Me "[/].*\nbinding=\['{{ autotype_shortcut }}'\].*\ncommand='mono {{ keepass_path }} --autotype'.*\nname='keepass2.autotype'"
    # This is a finnicky command, if the user's default shell is something other
    # than Bash, it might not go well.
    - shell: /bin/bash
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}

# @TODO: This is too complex to do in salt, need a Python renderer for it
update-dconf-keybindings:
  cmd.run:
    # We can use gsettings here just fine though
    - name: gsettings set org.cinnamon.desktop.keybindings custom-list "['org.cinnamon.desktop.keybindings.custom-keybinding.keepass2.autotype']"
    - unless: gsettings get org.cinnamon.desktop.keybindings custom-list | grep "\['org.cinnamon.desktop.keybindings.custom-keybinding.keepass2.autotype'\]"
    - user: {{ salt['pillar.get']('user-config:username', 'root') }}
    - require:
      - cmd: set-dconf-full-path
{% endif %}
