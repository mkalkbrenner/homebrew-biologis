require 'formula'

class FakemailPython < Formula
  homepage 'http://www.lastcraft.com/fakemail.php'
  url 'http://downloads.sourceforge.net/project/fakemail/fakemail-python/1.0/fakemail-python-1.0.tar.gz'
  sha256 'c7bbc1b1dd3810a9fb615e422ffb0deb4977e9075d2baf1028001c2ff569b8c0'

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}" 
  end

  def test
    system "true"
  end
end
