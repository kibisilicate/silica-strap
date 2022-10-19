#! /usr/bin/env bash

if [ "$(whoami)" != 'root' ]; then
  echo "error: $0 must be ran as root."
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

if [ -e '/usr/bin/silica-strap' ]; then
  echo "removing existing file '/usr/bin/silica-strap'"
  rm '/usr/bin/silica-strap'
fi

if [ -d '/usr/share/silica-strap' ]; then
  echo "removing existing directory '/usr/share/silica-strap'"
  rm --recursive '/usr/share/silica-strap'
fi

cp --verbose "$(pwd)/silica-strap" '/usr/bin/silica-strap'

mkdir --verbose '/usr/share/silica-strap'

cp --verbose "$(pwd)/functions" '/usr/share/silica-strap'

cp --verbose "$(pwd)/releases" '/usr/share/silica-strap'
