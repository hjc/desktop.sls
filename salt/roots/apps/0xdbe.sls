{% set _0xdbe_unzipped_path = '/opt/0xDBE-142.2927.6' %}

include:
  # while we need to install Java, we don't need to wait on Java to be instaled
  # before extracting IntelliJ, it will all get done by the time the user is
  # ready to use the system.
  - devutils.java.determine-default

0xdbe-source:
  archive.extracted:
    - name: /opt/
    - source: http://download.jetbrains.com/dbe/0xdbe-142.2927.6.tar.gz
    - source_hash: md5=a73433e6fce42275603ef414b9510c83
    - archive_format: tar
    - tar_options: z
    - if_missing: {{ _0xdbe_unzipped_path }}

/opt/0xdbe:
  file.symlink:
    - target: {{ _0xdbe_unzipped_path}}

