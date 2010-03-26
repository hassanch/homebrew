require 'formula'

class XapianCore <Formula
  url 'http://oligarchy.co.uk/xapian/1.0.18/xapian-core-1.0.18.tar.gz'
  homepage 'http://xapian.org'
  md5 'a6b911a68df200c99fb8f8f363fa7dad'

  def install
    system "./configure", "--disable-assertions", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
