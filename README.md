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

Now run salt (you might want to configure first though!).

```shell
salt-call state.highstate
```

## Configuring

To configure your install before running `state.highstate`, two things should be done.

### Configure Pillar Data

A number of items in the core package are configured via Salt Pillar data. You should
sweep through these Pillar states and configure them to match your system. The number
one Pillar package to look at would be apps.

Pillar data will be located at `/srv/pillar` after running `setup.sh`.

### Choose your apps to install

To configure your installable apps, you merely need to edit the `top.sls` file in
`/srv/salt`. Merely add the paths to the states you want, and remove what you don't!

For example, if you wanted to install `ack-grep` instead of `silverseacher-ag`, all
you would do is first remove this line 

```
include:
  ...
  - devutils.silversearcher # <============ Remove me
```

And replace it with this line:

```
include:
  ...
  - devutils.ack-grep # <============ Add me
```

And now ack-grep will be installed instead of silversearcher!
