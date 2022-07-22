#! /usr/bin/env bash

if [ "$(whoami)" != 'root' ]; then
  echo "error: install.sh must be ran as root."
  exit 1
fi

if [ ! -f "$(pwd)/silica-strap" ]; then
  echo "error: file '$(pwd)/silica-strap' does not exist."
  exit 1
fi

if [ ! -f "$(pwd)/functions" ]; then
  echo "error: file '$(pwd)/functions' does not exist."
  exit 1
fi

if [ ! -f "$(pwd)/releases" ]; then
  echo "error: file '$(pwd)/releases' does not exist."
  exit 1
fi

"$(pwd)/scripts/uninstall.sh"

mkdir --verbose '/usr/share/silica-strap'

cp --verbose "$(pwd)/silica-strap" '/usr/share/silica-strap'

chmod --verbose +x '/usr/share/silica-strap/silica-strap'

cp --verbose "$(pwd)/functions" '/usr/share/silica-strap'

cp --verbose "$(pwd)/releases" '/usr/share/silica-strap'

ln --verbose --symbolic '/usr/share/silica-strap/silica-strap' '/usr/bin/silica-strap'
