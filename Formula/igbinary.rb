class Igbinary < Formula
  desc "Drop in replacement for the standard php serializer."
  homepage "https://pecl.php.net/package/igbinary"
  url "https://github.com/igbinary/igbinary/archive/2.0.6.tar.gz"
  sha256 "c96ae44baa4290431f1977316f2e78aca44698c07258777584260db19aa6dac2"
  head "https://github.com/igbinary/igbinary.git"

  def install
    include.install Dir["src/*"]
  end
end
