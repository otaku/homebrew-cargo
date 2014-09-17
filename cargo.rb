require 'formula'

class Cargo < Formula
  arch = Hardware.is_64_bit? ? 'x86_64' : 'i686'
  os = OS.mac? ? 'apple-darwin' : 'unknown-linux-gnu'

  homepage 'http://crates.io/'
  url "http://static.rust-lang.org/cargo-dist/cargo-nightly-#{arch}-#{os}.tar.gz"

  head 'https://github.com/rust-lang/cargo'

  depends_on "rust"

  bottle do
  end

  def install
    args = ["--prefix=#{prefix}"]
    system "./install.sh", *args
  end

  test do
    system "#{bin}/cargo"
  end
end
