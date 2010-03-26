require 'formula'

class Python3k <Formula
  url 'http://www.python.org/ftp/python/3.1.1/Python-3.1.1.tar.bz2'
  homepage 'http://www.python.org/'
  md5 'd1ddd9f16e3c6a51c7208f33518cd674'

  # You can build Python without readline, but you really don't want to.
  depends_on 'readline' => :recommended

  def caveats
    "Please note that the 2to3 script is not installed as part of this brew as it would conflict with Python 2.6.4 itself."
  end

  def options
    [
      ["--framework", "Do a 'Framework' build instead of a UNIX-style build."],
      ["--universal", "Build for both 32 & 64 bit Intel."]
    ]
  end

  def skip_clean? path
    path == bin+'python' or path == bin+'python3.1' or # if you strip these, it can't load modules
    path == lib+'python3.1' # save a lot of time
  end

  def install
    args = ["--prefix=#{prefix}"]
    args << "--enable-framework" if ARGV.include? '--framework'
    args << "--with-universal-archs=intel" << "--enable-universalsdk=/" if ARGV.include? '--universal' \
            or ARGV.include? '--intel' # the old flag, preserved for back-compat
    
    # Speed up creation of libpython.a, backported from Unladen Swallow:
    # http://code.google.com/p/unladen-swallow/source/detail?r=856
    inreplace "Makefile.pre.in", "$(AR) cr", "$(AR) cqS"
    
    system "./configure", *args
    system "make"
    system "make install"
    
    # lib/python3.1/config contains a copy of libpython.a; make this a link instead
    (lib+'python3.1/config/libpython3.1.a').unlink
    (lib+'python3.1/config/libpython3.1.a').make_link lib+'libpython3.1.a'
    
    # Just in case... we really don't want this overlapping
    (bin+'2to3').delete
  end
end
