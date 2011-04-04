require 'formula'

class Core < Formula
  url 'http://www.janestreet.com/ocaml/core-0.7.0.tar.gz'
  homepage 'http://www.janestreet.com/ocaml/'
  md5 'fc6195e8727f1e08020bad06c3833bc3'

  depends_on 'sexplib'
  depends_on 'fieldslib'
  depends_on 'bin-prot'
  depends_on 'oUnit'

  def install
    system "./configure", "--prefix", "#{prefix}"
    system "make"
    system "make install"
  end
end
