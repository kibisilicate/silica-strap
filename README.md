# silica-strap

silica-strap is an alternative to debootstrap and mmdebstrap.

It can resolve simple dependencies internally and more complex dependencies using apt inside an internal environment.

It can run on any GNU + Linux distribution and use multiple mirrors, suites, components, and architectures.

## Installation

Clone the repository and enter directory.

```
git clone https://github.com/silica-dev/silica-strap

cd ./silica-strap
```

Run the install script with sudo or as root.

```
sudo ./scripts/install.sh
```

## Usage

Basic silica-strap usage:

```
sudo silica-strap -r=unstable -o=/mnt
```

Using apt to resolve dependencies:

```
sudo silica-strap -r=unstable -R=apt -o=/mnt
```

Outputting to a tarball:

```
sudo silica-strap -r=unstable -f=tarball -o=./debian-unstable.tar
```

Creating a buildd chroot:

```
sudo silica-strap -r=unstable -v=buildd -o=/mnt
```

