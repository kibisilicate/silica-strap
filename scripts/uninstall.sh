#! /usr/bin/env bash

if [ "$(whoami)" != 'root' ]; then
  echo "error: uninstall.sh must be ran as root."
  exit 1
fi

if [ -L '/usr/bin/silica-strap' ]; then
  echo "removing symlink '/usr/bin/silica-strap'"
  rm '/usr/bin/silica-strap'
fi

if [ -d '/usr/share/silica-strap' ]; then
  echo "removing directory '/usr/share/silica-strap'"
  rm --recursive '/usr/share/silica-strap'
fi
