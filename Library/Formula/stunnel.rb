require 'formula'

class Stunnel <Formula
  url 'http://www.stunnel.org/download/stunnel/src/stunnel-4.32.tar.gz'
  homepage 'http://www.stunnel.org'
  md5 '72379c615c5a4986c7981d0941ed2e6b'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
