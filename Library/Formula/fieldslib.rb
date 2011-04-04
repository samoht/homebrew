require 'formula'

class Fieldslib < Formula
  url 'http://www.janestreet.com/ocaml/fieldslib-0.1.2.tar.gz'
  homepage 'http://www.janestreet.com/ocaml/'
  md5 'd7cf2d3a815cd55352b0d5be164fc687'

  depends_on 'objective-caml'

  def install
    system "./configure", "--prefix", "#{prefix}"
    system "make"
    system "make install"
  end
end
