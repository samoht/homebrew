require 'formula'

class CoreExtended < Formula
  url 'http://www.janestreet.com/ocaml/core_extended-0.7.0.tar.gz'
  homepage 'http://www.janestreet.com/ocaml/'
  md5 'dec04007d897ab255b55275bcac4abcc'

  depends_on 'core'

  def install
    system "./configure", "--prefix", "#{prefix}"
    system "make"
    system "make install"
  end
end
