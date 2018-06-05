class Igbinary < Formula
  desc "Drop in replacement for the standard php serializer."
  homepage "https://pecl.php.net/package/igbinary"
  url "https://github.com/igbinary/igbinary/archive/2.0.6.tar.gz"
  sha256 "c96ae44baa4290431f1977316f2e78aca44698c07258777584260db19aa6dac2"
  head "https://github.com/igbinary/igbinary.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "3c260ff3fc5a1bfd4cf0b57f430ab041246ddbdf824b5f31083bb2e73a8d00f0" => :high_sierra
    sha256 "3c260ff3fc5a1bfd4cf0b57f430ab041246ddbdf824b5f31083bb2e73a8d00f0" => :sierra
    sha256 "3c260ff3fc5a1bfd4cf0b57f430ab041246ddbdf824b5f31083bb2e73a8d00f0" => :el_capitan
  end

  def install
    include.install Dir["src/*"]
  end
end
