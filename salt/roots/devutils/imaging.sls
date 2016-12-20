# simple state for all imaging packages; good for things like FFMPEG or
# Pillow.

imaging-packages:
  # use pkg.installed because updating these could be bad
  pkg.installed:
    - names:
      - zlib1g-dev
      - zlibc
      # @TODO: Figure out the right libjpeg for each platform...
      # this one is good for like trusty
      # - libjpeg-turbo8-dev
      # but this is what stretch wants
      - libjpeg62-turbo
      - libjpeg62-turbo-dev
