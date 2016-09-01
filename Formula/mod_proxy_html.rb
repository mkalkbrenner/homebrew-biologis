require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ModProxyHtml < Formula
  homepage 'http://apache.webthing.com/mod_proxy_html/'
  url 'http://apache.webthing.com/mod_proxy_html/mod_proxy_html.tar.bz2'
  sha256 'a1aee758bda605e153868b91188ebf2c527b8eeb0f115d11af152078e65895bf'
  version '3.1.2'
  
  depends_on 'httpd' => :build

  def patches; DATA; end

  def install
    system "/usr/local/sbin/apxs", "-c",
      "-I", "/usr/include/libxml2", "mod_xml2enc.c"
    system "/usr/local/sbin/apxs", "-c", "-I", ".",
      "-I", "/usr/include/libxml2", "mod_proxy_html.c"
    system "mkdir", "#{libexec}"
    system "mkdir", "#{libexec}/apache2"
    system "cp", ".libs/mod_xml2enc.so", "#{libexec}/apache2/mod_xml2enc.so"
    system "cp", ".libs/mod_proxy_html.so", "#{libexec}/apache2/mod_proxy_html.so"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test mod_proxy_html`.
    system "true"
  end

  def caveats
    <<-EOS.undent
    You must manually edit /usr/local/etc/apache2/httpd.conf:
    
      LoadFile /usr/lib/libxml2.dylib
      LoadModule xml2enc_module #{libexec}/apache2/mod_xml2enc.so
      LoadModule proxy_html_module #{libexec}/apache2/mod_proxy_html.so
      
    EOS
  end
end

__END__
--- a/mod_xml2enc.c	2009-10-30 16:23:30.000000000 +0100
+++ b/mod_xml2enc.c	2012-05-31 13:26:28.000000000 +0200
@@ -40,9 +40,7 @@
 
 **********************************************************************/
 
-/* Version 1.0.3 - Bugfix against crash on no-content-type response
- *                 reaching the filter function
- */
+/* Version 1.0.4 - Bugfix - ensure EOS gets propagated correctly */
 
 #if defined(WIN32)
 #define XML2ENC_DECLARE_EXPORT
@@ -364,6 +362,8 @@
           apr_bucket_setaside(b, f->r->pool);
         }
         return APR_SUCCESS;
+      } else {
+        /* NRK not enough data to do anything.  Just get out of it */
       }
     }
     if (ctx->bblen == -1) {
@@ -402,7 +402,9 @@
     if (APR_BUCKET_IS_METADATA(b)) {
       if (APR_BUCKET_IS_EOS(b)) {
         /* send remaining data */
-        return ap_fflush(f->next, ctx->bbnext);
+        APR_BUCKET_REMOVE(b);
+        APR_BRIGADE_INSERT_TAIL(ctx->bbnext, b);
+        return ap_pass_brigade(f->next, ctx->bbnext);
       } else if (APR_BUCKET_IS_FLUSH(b)) {
         ap_fflush(f->next, ctx->bbnext);
       }
