class Birdhouse < Formula
  desc "CLI tool for managing GitHub workflow templates and daily thread automation"
  homepage "https://github.com/birdcar/birdhouse"
  version "0.1.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-darwin-arm64"
      sha256 "83f9f03bae1dbd759f3ba77404b4f33e3d94d6abbbf7f3066ff714040d614192"
    end
    on_intel do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-darwin-x64"
      sha256 "62b164d61a024469d053503377314a2ba8a32674fc2cfac6679754b6dd191858"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-linux-arm64"
      sha256 "dba3caaccaeb30214df8594dab2c9bdeed0fe4013a681af10e5ca61c679194c4"
    end
    on_intel do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-linux-x64"
      sha256 "20afad7aabe5dcc8e9a8c7a1f87873c1272e76270b1faeac1ead845f993621df"
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
