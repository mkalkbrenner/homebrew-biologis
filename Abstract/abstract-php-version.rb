class AbstractPhpVersion < Formula
  module PhpdbgDefs
    PHPDBG_SRC_TARBALL = "https://github.com/krakjoe/phpdbg/archive/v0.3.2.tar.gz".freeze
    PHPDBG_CHECKSUM    = {
      :sha256 => "feab6e29ef9a490aa53332fe014e8026d89d970acc5105f37330b2f31e711bbd",
    }.freeze
  end

  module Php56Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-5.6.36.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "5.6.36".freeze
    PHP_BRANCH      = "PHP-5.6".freeze

    PHP_CHECKSUM    = {
      :sha256 => "626a0e3f5d8a0e686a2b930f0dd3a0601fe3dcb5e43dd0e8c3fab631e64e172a",
    }.freeze
  end

  module Php70Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.0.30.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.0.30".freeze
    PHP_BRANCH      = "PHP-7.0".freeze

    PHP_CHECKSUM    = {
      :sha256 => "213f38400c239b8fab2f6f59d6f4d4bd463d0a75bd4edf723dd4d5fea8850b50",
    }.freeze
  end

  module Php71Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.1.17.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.1.17".freeze
    PHP_BRANCH      = "PHP-7.1".freeze

    PHP_CHECKSUM    = {
      :sha256 => "e124e3ac552c50f3890ed981d07b2ee473cac961885e75186ded0bbb5b78dbcf",
    }.freeze
  end

  module Php72Defs
    PHP_SRC_TARBALL = "https://php.net/get/php-7.2.5.tar.bz2/from/this/mirror".freeze
    PHP_GITHUB_URL  = "https://github.com/php/php-src.git".freeze
    PHP_VERSION     = "7.2.5".freeze
    PHP_BRANCH      = "PHP-7.2".freeze

    PHP_CHECKSUM    = {
      :sha256 => "f3820efa8efa79628b6e1b5b2f8c1b04c08d32e6721fa1654039ce5f89796031",
    }.freeze
  end
end
