{% set intellij_unzipped_path = '/opt/idea-IU-143.1821.5' %}

include:
  # while we need to install Java, we don't need to wait on Java to be instaled
  # before extracting IntelliJ, it will all get done by the time the user is
  # ready to use the system.
  - devutils.java.determine-default

idea-source:
  archive.extracted:
    - name: /opt/
    - source: http://download.jetbrains.com/idea/ideaIU-15.0.3.tar.gz
    - source_hash: md5=a09bbb21987b0ed2aefab77c2a7efbf6
    - archive_format: tar
    - tar_options: z
    - if_missing: {{ intellij_unzipped_path }}

/opt/intellij:
  file.symlink:
    - target: {{ intellij_unzipped_path }}

