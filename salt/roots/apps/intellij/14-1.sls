{% set intellij_unzipped_path = '/opt/idea-IU-141.1532.4' %}

include:
  # while we need to install Java, we don't need to wait on Java to be instaled
  # before extracting IntelliJ, it will all get done by the time the user is
  # ready to use the system.
  - devutils.java.determine-default

idea-source:
  archive.extracted:
    - name: /opt/
    - source: http://download.jetbrains.com/idea/ideaIU-14.1.4.tar.gz
    - source_hash: md5=10a66cd5d82aeae719284c91e36ed36f
    - archive_format: tar
    - tar_options: z
    - if_missing: {{ intellij_unzipped_path }}

/opt/intellij:
  file.symlink:
    - target: {{ intellij_unzipped_path }}

