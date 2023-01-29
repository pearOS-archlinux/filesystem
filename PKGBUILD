# Maintainer: Alexandru Balan

pkgname=filesystem
pkgver=2023.01.30
=======
pkgver=2023.01.30
pkgrel=2
pkgdesc='Base Arch Linux files'
arch=('x86_64')
license=('GPL')
url='https://nicec0re.pearos.xyz'
depends=('iana-etc')
backup=('etc/crypttab' 'etc/fstab' 'etc/group' 'etc/gshadow' 'etc/host.conf'
        'etc/hosts' 'etc/issue' 'etc/ld.so.conf' 'etc/nsswitch.conf'
        'etc/passwd' 'etc/profile' 'etc/resolv.conf' 'etc/securetty'
        'etc/shadow' 'etc/shells')
source=('crypttab' 'env-generator' 'fstab' 'group' 'gshadow' 'host.conf' 'hosts'
        'issue' 'ld.so.conf' 'locale.sh' 'nsswitch.conf' 'os-release'
        'passwd' 'profile' 'resolv.conf' 'securetty' 'shadow' 'shells' 'sysctl'
        'sysusers' 'tmpfiles' 'nicec0re-logo.png'
        'archlinux-logo-text.svg' 'archlinux-logo-text-dark.svg')
md5sums=('5fa6674df7645d7f5895f2d12b4ef4e9'
         '2b0344e9639f35f3c0d5637a23556089'
         'e33f6dfdd61978fcb3ddf1431286e05a'
         '7fed1e1fb855e41a6d64d41f8521d69a'
         '1c1e3b08acfa286f4b417c49de3e4366'
         '7d119a9cce152aa182fb3392ddeecea7'
         'a1315ea3e2b64d197b6efaf9c14ff778'
         '7813c481156f6b280a3ba91fc6236368'
         '5deb9f890a4d08a245e9752ede77271e'
         '580cf8b59eebfaac4fad373ffadc9912'
         'a3de66d416718325442f739d6c1d4e50'
         '67a08f5dff7a48e273d4d2bcc5f46c26'
         '5182ac38a0de85da8ade93ef71975ca4'
         '448fe7cbcb566e8d318dc0db0c9cb710'
         '0ee015fad07732676d9488ae498eed41'
         'f04bcb2803afc4dcb95670fe87343b4d'
         '815652599be54fd3607cf276e89a0a19'
         'a78cd8d7f8240a8448edee82f503c34e'
         'a51847c012555c843dbdf8df0da171d3'
         'af7832eabaac9804c22f1f2b53816a49'
         '3e6f8df6119067f600f8a055cbe51773'
         '0cee17d0f8900479962465196b2dc4b6'
         '6642e6c6baf88c813aa3533152fc4aba'
         '0897bf24867f7c6e8c68e5c183216c3d')
package() {
  cd "$pkgdir"

  # setup root filesystem
  for d in boot dev etc home mnt usr var opt srv/http run; do
    install -d -m755 $d
  done
  install -d -m555 proc
  install -d -m555 sys
  install -d -m0750 root
  install -d -m1777 tmp
  # vsftpd won't run with write perms on /srv/ftp
  # ftp (uid 14/gid 11)
  install -d -m555 -g 11 srv/ftp

  # setup /etc and /usr/share/factory/etc
  install -d etc/{ld.so.conf.d,skel,profile.d} usr/share/factory/etc
  for f in fstab group host.conf hosts issue ld.so.conf nsswitch.conf \
  passwd resolv.conf securetty shells profile; do
    install -m644 "$srcdir"/$f etc/
    install -m644 "$srcdir"/$f usr/share/factory/etc/
  done
  ln -s ../proc/self/mounts etc/mtab
  for f in gshadow shadow crypttab; do
    install -m600 "$srcdir"/$f etc/
    install -m600 "$srcdir"/$f usr/share/factory/etc/
  done
  touch etc/arch-release
  install -m644 "$srcdir"/locale.sh etc/profile.d/locale.sh
  install -Dm644 "$srcdir"/os-release usr/lib/os-release

  # setup /var
  for d in cache local opt log/old lib/misc empty; do
    install -d -m755 var/$d
  done
  install -d -m1777 var/{tmp,spool/mail}

  # allow setgid games (gid 50) to write scores
  install -d -m775 -g 50 var/games
  ln -s spool/mail var/mail
  ln -s ../run var/run
  ln -s ../run/lock var/lock

  # setup /usr hierarchy
  for d in bin include lib share/{misc,pixmaps} src; do
    install -d -m755 usr/$d
  done
  for d in {1..8}; do
    install -d -m755 usr/share/man/man$d
  done

  # add lib symlinks
  ln -s usr/lib lib
  [[ $CARCH = 'x86_64' ]] && {
    ln -s usr/lib lib64
    ln -s lib usr/lib64
  }

  # add bin symlinks
  ln -s usr/bin bin
  ln -s usr/bin sbin
  ln -s bin usr/sbin

  # setup /usr/local hierarchy
  for d in bin etc games include lib man sbin share src; do
    install -d -m755 usr/local/$d
  done
  ln -s ../man usr/local/share/man

  # setup systemd-sysctl
  install -D -m644 "$srcdir"/sysctl usr/lib/sysctl.d/10-arch.conf

  # setup systemd-sysusers
  install -D -m644 "$srcdir"/sysusers usr/lib/sysusers.d/arch.conf

  # setup systemd-tmpfiles
  install -D -m644 "$srcdir"/tmpfiles usr/lib/tmpfiles.d/arch.conf

  # setup systemd.environment-generator
  install -D -m755 "$srcdir"/env-generator usr/lib/systemd/system-environment-generators/10-arch

  # add logo
  #install -D -m644 "$srcdir"/nicec0re-logo{.png,.svg,-text.svg,-text-dark.svg} usr/share/pixmaps
  install -D -m644 "$srcdir"/nicec0re-logo.png usr/share/pixmaps
}

# vim:set ts=2 sw=2 et:
md5sums=('5fa6674df7645d7f5895f2d12b4ef4e9'
         '2b0344e9639f35f3c0d5637a23556089'
         'e33f6dfdd61978fcb3ddf1431286e05a'
         '7fed1e1fb855e41a6d64d41f8521d69a'
         '1c1e3b08acfa286f4b417c49de3e4366'
         '7d119a9cce152aa182fb3392ddeecea7'
         'a1315ea3e2b64d197b6efaf9c14ff778'
         '7813c481156f6b280a3ba91fc6236368'
         '5deb9f890a4d08a245e9752ede77271e'
         '580cf8b59eebfaac4fad373ffadc9912'
         'a3de66d416718325442f739d6c1d4e50'
         '25b55ec0a20f2eeaf3f54d50a68a2198'
         '5182ac38a0de85da8ade93ef71975ca4'
         '448fe7cbcb566e8d318dc0db0c9cb710'
         '0ee015fad07732676d9488ae498eed41'
         'f04bcb2803afc4dcb95670fe87343b4d'
         '815652599be54fd3607cf276e89a0a19'
         'a78cd8d7f8240a8448edee82f503c34e'
         'a51847c012555c843dbdf8df0da171d3'
         'af7832eabaac9804c22f1f2b53816a49'
         '3e6f8df6119067f600f8a055cbe51773'
         '0cee17d0f8900479962465196b2dc4b6'
         '6642e6c6baf88c813aa3533152fc4aba'
         '0897bf24867f7c6e8c68e5c183216c3d')
md5sums=('5fa6674df7645d7f5895f2d12b4ef4e9'
         '2b0344e9639f35f3c0d5637a23556089'
         'e33f6dfdd61978fcb3ddf1431286e05a'
         '7fed1e1fb855e41a6d64d41f8521d69a'
         '1c1e3b08acfa286f4b417c49de3e4366'
         '7d119a9cce152aa182fb3392ddeecea7'
         'a1315ea3e2b64d197b6efaf9c14ff778'
         '5e2329a1b4e8e6896127c4b3bca88dec'
         '5deb9f890a4d08a245e9752ede77271e'
         '580cf8b59eebfaac4fad373ffadc9912'
         'a3de66d416718325442f739d6c1d4e50'
         'ad1550b2e6ea128ece819a4619728b5a'
         '5182ac38a0de85da8ade93ef71975ca4'
         '448fe7cbcb566e8d318dc0db0c9cb710'
         '0ee015fad07732676d9488ae498eed41'
         'f04bcb2803afc4dcb95670fe87343b4d'
         '815652599be54fd3607cf276e89a0a19'
         'a78cd8d7f8240a8448edee82f503c34e'
         'a51847c012555c843dbdf8df0da171d3'
         'af7832eabaac9804c22f1f2b53816a49'
         '3e6f8df6119067f600f8a055cbe51773'
         '0cee17d0f8900479962465196b2dc4b6'
         '6642e6c6baf88c813aa3533152fc4aba'
         '0897bf24867f7c6e8c68e5c183216c3d')
