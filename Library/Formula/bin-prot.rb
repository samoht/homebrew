require 'formula'

class BinProt < Formula
  url 'http://www.janestreet.com/ocaml/bin_prot-1.3.1.tar.gz'
  homepage 'http://www.janestreet.com/ocaml/'
  md5 '6ed3471d26ede09250cbcef21f9fb966'

  depends_on 'type-conv'

  def install
    system "./configure", "--prefix", "#{prefix}"
    system "make"
    system "make install"
  end
end
