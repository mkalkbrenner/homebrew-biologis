require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ModPerl < Formula
  homepage 'http://perl.apache.org/'
  url 'http://archive.apache.org/dist/perl/mod_perl-2.0.7.tar.gz'
  version '2.0.7'
  sha1 '364143b2aef3c6dae69a8a2ea5d8ea2462882cd3'

  def install
    ENV.j1  # if your formula's build system can't parallelize

    system "perl", "Makefile.PL", "MP_APXS=/usr/local/sbin/apxs", "MP_CCOPTS=-std=gnu89", "DESTDIR=#{prefix}"
    system "make"
    system "make install"
  end

  def test
    system "true"
  end
end
