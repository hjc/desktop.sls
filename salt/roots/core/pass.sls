##
# This is an intentionally empty salt state that is used for syntatical purposes
# when creating valid imports.
#
# Consider this:
#
# ```
# include:
#   {% if grains['os'] == 'Debian' %}
#   - foo.bar
#   {% elif grains['os'] == 'RedHat' %}
#   - foo.baz
#   {% endif %}
# ```
#
# In this scenario, a single `include:` cannot be used because there is no
# blanket else condition. If the `os` grain was `Ubuntu` for example, we would
# render out:
#
# ```
# include:
# ```
#
# Which is an invalid state. So the obvious workaround becomes:
#
# ```
# {% if grains['os'] == 'Debian' %}
# include:
#   - foo.bar
# {% endif %}
#
# {% if grains['os'] == 'RedHat' %}
# include:
#   - foor.baz
# {% endif %}
# ```
#
# This is a less than ideal fix for the scenario because what if we need to go
# back to the file and later update it to include a general include that is run
# no matter the OS? Now we have to refactor! Thus, `core.pass` was created. It
# can be used like so:
#
# ```
# include:
#   - core.pass
# ```
#
# Letting you rewrite the above as:
#
# ```
# include:
#   - core.pass
#   {% if grains['os'] == 'Debian' %}
#   - foo.bar
#   {% elif grains['os'] == 'RedHat' %}
#   - foo.baz
#   {% endif %}
# ```
##