require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ModProxyHtml < Formula
  homepage 'http://apache.webthing.com/mod_proxy_html/'
  url 'http://apache.webthing.com/mod_proxy_html/mod_proxy_html.tar.bz2'
  md5 'd6497b48d2bffc4150472472004618c3'
  version '3.1.2'
  
  depends_on 'httpd' => :build

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
