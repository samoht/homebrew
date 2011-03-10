require 'formula'

class Lwt <Formula
  url 'http://ocsigen.org/download/lwt-2.2.1.tar.gz'
  homepage 'http://ocsigen.org/lwt'
  md5 '749546032f4fdd686d4b5dc7ecdf30ac'

  depends_on 'objective-caml'
  depends_on 'findlib'
  depends_on 'libev'
  skip_clean :all

  def install
    system "./configure", "--prefix", HOMEBREW_PREFIX, "--mandir", man
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "make"
    system "make install"
  end

end
