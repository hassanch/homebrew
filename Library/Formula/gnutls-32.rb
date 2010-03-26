require 'formula'

class Gnutls32 <Formula
  @url='http://ftp.gnu.org/pub/gnu/gnutls/gnutls-2.8.5.tar.bz2'
  @homepage='http://www.gnu.org/software/gnutls/gnutls.html'
  @sha1='5121c52efd4718ad3d8b641d28343b0c6abaa571'

  depends_on 'libgcrypt-32'
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
          
    system "./configure", "--prefix=#{prefix}", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-guile", "--disable-cxx"
    system "make install"
  end
end
