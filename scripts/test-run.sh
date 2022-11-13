#! /usr/bin/env bash

if ! ./scripts/install.sh > /dev/null; then exit 1; fi

declare my_format='directory'
#declare my_format='tarball'

declare -a my_suites=(
  'unstable' # 'experimental'
  #'testing'
  #'stable'
  #'oldstable'
  #'devel'
  #'jammy'
  #'focal'
  #'bionic'
)

declare -a my_components=(
  'main'
  # Extra Debian components:
  #'contrib' # 'non-free'
  # Extra Ubuntu components:
  #'universe' # 'multiverse' # 'restricted'
)

declare -a my_architectures=(
  #'host'
  #'alpha'
  'amd64'
  #'arm64'
  #'armel'
  #'armhf'
  #'hppa'
  #'i386'
  #'ia64'
  #'m68k'
  #'mips64el'
  #'mipsel'
  #'powerpc'
  #'ppc64'
  #'ppc64el'
  #'riscv64'
  #'s390x'
  #'sh4'
  #'sparc64'
  #'x32'
)

#declare my_variant='essential'
#declare my_variant='apt-essential'
declare my_variant='required'
#declare my_variant='buildd'
#declare my_variant='important'
#declare my_variant='standard'

declare my_mirrors=(
  # Debian mirrors:
  'https://deb.debian.org/debian'
  #'https://deb.debian.org/debian-ports'
  #'http://archive.debian.org/debian'
  # Ubuntu mirrors:
  #'http://archive.ubuntu.com/ubuntu'
  #'http://ports.ubuntu.com/ubuntu-ports'
  #'https://old-releases.ubuntu.com/ubuntu'
)

declare my_resolver='apt'
#declare my_resolver='internal'
#declare my_resolver='none'

declare my_downloader='apt'
#declare my_downloader='curl'
#declare my_downloader='wget'

#declare my_extractor='ar'
declare my_extractor='internal-dpkg-deb'
#declare my_extractor='host-dpkg-deb'

silica-strap \
  --discard \
  --format="$my_format" \
  --releases="$(echo "${my_suites[@]}")" \
  --components="$(echo "${my_components[@]}")" \
  --architectures="$(echo "${my_architectures[@]}")" \
  --variant="$my_variant" \
  --mirrors="$(echo "${my_mirrors[@]}")" \
  --resolver="$my_resolver" \
  --downloader="$my_downloader" \
  --extractor="$my_extractor" \
  $(echo "$@") \
  #--environment-hook="nano \"\$ENVIRONMENT/etc/apt/sources.list.d/sources.sources\"" \
  #--target-hook="chroot \"\$TARGET\" /usr/bin/env --ignore-environment bash -c \"export HOME='/root'; export TERM='$TERM'; bash --login\""

if [ "$?" = '0' ]; then
  exit 0
else
  exit 1
fi
