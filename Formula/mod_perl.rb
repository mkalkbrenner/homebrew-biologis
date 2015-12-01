require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ModPerl < Formula
  homepage 'http://perl.apache.org/'
  url 'http://archive.apache.org/dist/perl/mod_perl-2.0.9.tar.gz'
  version '2.0.9'
  sha1 '5de3018214da21de186d758a429d5c78f827caa5'

  depends_on :apr => :build

  def install
    ENV.j1  # if your formula's build system can't parallelize
    
    system "perl", "Makefile.PL", "MP_APXS=/usr/local/bin/apxs", "MP_APR_CONFIG=#{Formula["apr"].opt_prefix}/bin/apr-1-config", "MP_CCOPTS=-std=gnu89", "DESTDIR=#{prefix}"
    system "make"
    system "make install"
  end

  def test
    system "true"
  end
end
