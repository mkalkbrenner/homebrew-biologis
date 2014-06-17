require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ModPerl < Formula
  homepage 'http://perl.apache.org/'
  url 'http://archive.apache.org/dist/perl/mod_perl-2.0.8.tar.gz'
  version '2.0.8'
  sha1 '165b1062f9680d1ccc92a88f1699797b6860c499'

  def install
    ENV.j1  # if your formula's build system can't parallelize

    system "perl", "Makefile.PL", "MP_APXS=/usr/local/bin/apxs", "MP_CCOPTS=-std=gnu89", "DESTDIR=#{prefix}"
    system "make"
    system "make install"
  end

  def test
    system "true"
  end
end
