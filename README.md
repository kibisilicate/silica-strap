# silica-strap

silica-strap bootstraps a Debian system using one or more suites, components, architectures, and mirrors.
It can resolve simple dependencies itself and more complex dependencies using apt inside its internal environment.

silica-strap can be used to create a base Debian installation or a Debian chroot environment.

On first run, silica-strap will bootstrap a small (less than 150MB) internal environment to provide itself a copy of apt and dpkg.
This prevents the hosts apt and dpkg from influencing the result of the bootstrap.
This also gives silica-strap the ability to run on any GNU + Linux distribution, not just Debian, Ubuntu, and their derivatives.

silica-strap was created as an alternative to debootstrap and mmdebstrap.

## Installation

Clone the repository and enter directory.

```
# git clone https://github.com/silica-dev/silica-strap

# cd ./silica-strap
```

Then run with sudo or as root.

```
# make

# make install
```

## Usage

Basic silica-strap usage:

```
# silica-strap -r=unstable -o=/mnt
```

Using the internal dependency resolver:

```
# silica-strap -r=unstable -R=internal -o=/mnt
```

Output to a tarball:

```
# silica-strap -r=unstable -o=./debian-unstable.tar
```

Create a buildd chroot:

```
# mkdir -v ./debian-buildd-chroot

# silica-strap -r=unstable -v=buildd -o=./debian-buildd-chroot
```

