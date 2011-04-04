require 'formula'

class Sexplib < Formula
  url 'http://www.janestreet.com/ocaml/sexplib-5.2.1.tar.gz'
  homepage 'http://www.janestreet.com/ocaml/'
  md5 '5750870c9a48434ecec6344cebcdbc42'

  depends_on 'type-conv'

  def install
    system "./configure", "--prefix", "#{prefix}"
    system "make"
    system "make install"
  end
end
