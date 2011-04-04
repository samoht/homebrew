require 'formula'

class ObjectiveCaml < Formula
  url 'http://caml.inria.fr/pub/distrib/ocaml-3.12/ocaml-3.12.0.tar.bz2'
  homepage 'http://caml.inria.fr/ocaml/index.en.html'
  md5 'bd92c8970767f412bc1e9a6c625b5ccf'

  # Don't strip symbols, so dynamic linking doesn't break.
  skip_clean :all

  def patches
    # set (ocamlc -where) to point to HOMEBREW_PREFIX instead of the cellar
    DATA
  end

  def install
    system "./configure", "--prefix", HOMEBREW_PREFIX, "--mandir", man
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    ENV.append "REAL_LIBDIR", "#{HOMEBREW_PREFIX}/lib/ocaml"
    system "make world"
    system "make opt"
    system "make opt.opt"
    system "make PREFIX=#{prefix} install"

    # site-lib in the Cellar will be a symlink to the HOMEBREW_PREFIX location
    (HOMEBREW_PREFIX+"lib/ocaml/site-lib").mkpath
    ln_s HOMEBREW_PREFIX+"lib/ocaml/site-lib", lib+"ocaml/site-lib"
  end
end
__END__
--- old/Makefile	2010-11-23 20:16:44.000000000 +0100
+++ new/Makefile	2010-11-23 20:17:37.000000000 +0100
@@ -373,7 +373,7 @@
 
 utils/config.ml: utils/config.mlp config/Makefile
 	@rm -f utils/config.ml
-	sed -e 's|%%LIBDIR%%|$(LIBDIR)|' \
+	sed -e 's|%%LIBDIR%%|$(REAL_LIBDIR)|' \
 	    -e 's|%%BYTERUN%%|$(BINDIR)/ocamlrun|' \
 	    -e 's|%%CCOMPTYPE%%|cc|' \
 	    -e 's|%%BYTECC%%|$(BYTECC) $(BYTECCCOMPOPTS) $(SHAREDCCCOMPOPTS)|' \
