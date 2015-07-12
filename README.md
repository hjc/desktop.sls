# Kosher

## Getting Started

First create a folder for your gits:

```shell
mkdir gits
cd gits
apt-get install git
git clone git@github.com:hjc1710/desktop
```

Now run the step script:

```shell
sudo bash setup.sh
```

This script installs salt and symlinks some folders, so it needs to be run as root. Or do
some permission changes and run it.

Now run salt.

```shell
salt-call state.highstate
```
