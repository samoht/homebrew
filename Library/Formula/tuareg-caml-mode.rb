require 'formula'

class TuaregCamlMode < Formula
  url 'http://forge.ocamlcore.org/frs/download.php/516/tuareg-caml-mode.tar.gz'
  homepage 'http://tuareg.forge.ocamlcore.org/'
  md5 '70dbeceb79f8c81155f9d0f0cf0f7f57'
  version '2.0.1'

  depends_on 'objective-caml'

  def install
    system "make"
    system "make install"
  end
end
