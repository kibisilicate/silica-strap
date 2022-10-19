#! /usr/bin/env bash

if [ "$(whoami)" != 'root' ]; then
  echo "error: $0 must be ran as root."
  exit 1
fi

if [ -e '/usr/bin/silica-strap' ]; then
  echo "removing file '/usr/bin/silica-strap'"
  rm '/usr/bin/silica-strap'
fi

if [ -d '/usr/share/silica-strap' ]; then
  echo "removing directory '/usr/share/silica-strap'"
  rm --recursive '/usr/share/silica-strap'
fi

if [ -d '/var/cache/silica-strap' ]; then
  echo "removing directory '/var/cache/silica-strap'"
  rm --recursive '/var/cache/silica-strap'
fi
