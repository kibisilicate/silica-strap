#! /usr/bin/env bash

if ! ./scripts/install.sh &> /dev/null; then exit 1; fi

#declare -a my_architectures+=('host')
#declare -a my_architectures+=('alpha')
declare -a my_architectures+=('amd64')
#declare -a my_architectures+=('arm64')
#declare -a my_architectures+=('armel')
#declare -a my_architectures+=('armhf')
#declare -a my_architectures+=('hppa')
#declare -a my_architectures+=('i386')
#declare -a my_architectures+=('ia64')
#declare -a my_architectures+=('m68k')
#declare -a my_architectures+=('mips64el')
#declare -a my_architectures+=('mipsel')
#declare -a my_architectures+=('powerpc')
#declare -a my_architectures+=('ppc64')
#declare -a my_architectures+=('ppc64el')
#declare -a my_architectures+=('riscv64')
#declare -a my_architectures+=('s390x')
#declare -a my_architectures+=('sh4')
#declare -a my_architectures+=('sparc64')
#declare -a my_architectures+=('x32')

declare -a my_suites+=('unstable')
#declare -a my_suites+=('testing')
#declare -a my_suites+=('stable')
#declare -a my_suites+=('oldstable')
#declare -a my_suites+=('devel')
#declare -a my_suites+=('jammy')
#declare -a my_suites+=('focal')
#declare -a my_suites+=('bionic')

declare -a my_components+=('main')
#declare -a my_components+=('contrib')
#declare -a my_components+=('non-free')
#declare -a my_components+=('universe')
#declare -a my_components+=('multiverse')
#declare -a my_components+=('restricted')

#declare my_variant='essential'
#declare my_variant='apt-essential'
#declare my_variant='required'
#declare my_variant='buildd'
#declare my_variant='important'
declare my_variant='standard'

declare my_format='directory'
#declare my_format='tarball'

declare my_compression='none'
#declare my_compression='bzip2'
#declare my_compression='gzip'
#declare my_compression='xz'
#declare my_compression='zstd'

declare my_resolver='apt'
#declare my_resolver='internal'
#declare my_resolver='none'

declare my_downloader='apt'
#declare my_downloader='curl'
#declare my_downloader='wget'

declare my_extractor='ar'
#declare my_extractor='env-dpkg-deb'
#declare my_extractor='host-dpkg-deb'

silica-strap \
  --discard-output \
  --architectures="$(echo "${my_architectures[@]}")" \
  --releases="$(echo "${my_suites[@]}")" \
  --components="$(echo "${my_components[@]}")" \
  --variant="$my_variant" \
  --format="$my_format" \
  --compression="$my_compression" \
  --resolver="$my_resolver" \
  --downloader="$my_downloader" \
  --extractor="$my_extractor" \
  $(echo "$@")

if [ "$?" = '0' ]; then
  exit 0
else
  exit 1
fi

#  --environment-hook="nano \"\$CHROOT_DIRECTORY/etc/apt/sources.list.d/sources.sources\"" \
#  --target-hook="chroot \"\$CHROOT_DIRECTORY\" /usr/bin/env --ignore-environment bash -c \"export HOME='/root'; export TERM='$TERM'; bash --login\"" \
