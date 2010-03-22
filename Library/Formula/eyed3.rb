require 'formula'

class Eyed3 <Formula
  url 'http://eyed3.nicfit.net/releases/eyeD3-0.6.9.tar.gz'
  homepage 'http://eyed3.nicfit.net/'
  md5 '1357bf09545ba97de357c55bd2bcaf0c'

  depends_on 'python'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
