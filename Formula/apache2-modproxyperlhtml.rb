require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Apache2Modproxyperlhtml < Formula
  homepage 'http://modproxyhtml.darold.net/'
  url 'http://search.cpan.org/CPAN/authors/id/D/DA/DAROLD/Apache2-ModProxyPerlHtml-3.4-1.tar.gz'
  version '3.4-1'
  sha1 'fc9b389ca40a133c298b635c72e95574ea76cbfa'

  def install
    ENV.j1  # if your formula's build system can't parallelize

    #system "perl", "Makefile.PL", "MP_APXS=/usr/local/sbin/apxs", "DESTDIR=#{prefix}"
    system "perl", "Makefile.PL", "DESTDIR=#{prefix}"
    system "make"
    system "make install"
  end

  def test
    system "true"
  end
end
