require 'formula'

class Curl <Formula
  url 'http://curl.haxx.se/download/curl-7.19.7.tar.bz2'
  homepage 'http://curl.haxx.se'
  md5 '79a8fbb2eed5464b97bdf94bee109380'

  def keg_only?
    :provided_by_osx
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
