class Birdhouse < Formula
  desc "CLI tool for managing GitHub workflow templates and daily thread automation"
  homepage "https://github.com/birdcar/birdhouse"
  version "0.1.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-darwin-arm64"
      sha256 "5732cf47edb0b9a76f60aa5e4c2c053913aa4cd6844295905a545124d108a919"
    end
    on_intel do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-darwin-x64"
      sha256 "5f1a7321037e537877ce15cd960592e4c8a146267560343ae49a0a20dc1600ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-linux-arm64"
      sha256 "c9666dd179184c973c3957d020fc1f3b28b99cffaad0428ffa966d4dd7b0e8f3"
    end
    on_intel do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-linux-x64"
      sha256 "08a6aecab2ac12ca2a9ace7dfaa19bbdc1f89f90242f8483178e330a32d7df35"
    end
  end

  def install
    bin.install Dir["bh-*"].first => "bh"
    bin.install_symlink "bh" => "birdhouse"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bh --version")
  end
end
