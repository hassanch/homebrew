require 'formula'

class Libgcrypt32 <Formula
  url 'ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-1.4.5.tar.bz2'
  sha1 'ef7ecbd3a03a7978094366bcd1257b3654608d28'
  homepage 'http://www.gnupg.org/'

  depends_on 'libgpg-error-32'

  def keg_only? ; <<-EOS
We don't want this conflicting as it is only here for wine... so keg_only it
    EOS
  end

  def install
    ENV.j1

    build32 = "-arch i386 -m32"
    ENV.append "CFLAGS", build32
    ENV.append "CXXFLAGS", "-D_DARWIN_NO_64_BIT_INODE"
    ENV.append "LDFLAGS", build32

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-asm"
    # Separate steps, or parallel builds fail
    system "make"
    system "make install"
  end
end
