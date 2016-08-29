require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ModPerl < Formula
  homepage 'http://perl.apache.org/'
  url 'http://archive.apache.org/dist/perl/mod_perl-2.0.9.tar.gz'
  version '2.0.9'
  sha256 '0260f26ab771c1c95fadc67544b3400e420bb30b8a77565d2d02ad05498ef52b'

  depends_on :apr => :build
  depends_on "httpd24" => :build

  def install
    ENV.j1  # if your formula's build system can't parallelize
    
    system "perl", "Makefile.PL", "MP_APXS=/usr/local/bin/apxs", "MP_APR_CONFIG=#{Formula["apr"].opt_prefix}/bin/apr-1-config", "MP_CCOPTS=-std=gnu89", "DESTDIR=#{prefix}"
    system "make"
    system "make install"

    libexec.install "#{prefix}#{Formula["httpd24"].prefix}/libexec/mod_perl.so"
  end

  def test
    system "true"
  end
end
