require 'formula'

class TypeConv < Formula
  url 'http://www.janestreet.com/ocaml/type-conv-2.3.0.tar.gz'
  homepage 'http://www.janestreet.com/ocaml/'
  md5 '97adcd20f63bec4df7fca1f5d371030e'

  depends_on "objective-caml"

  def install
    system "./configure", "--prefix", "#{prefix}"
    system "make"
    system "make install"
  end
end
