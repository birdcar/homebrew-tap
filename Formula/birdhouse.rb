class Birdhouse < Formula
  desc "CLI tool for managing GitHub workflow templates and daily thread automation"
  homepage "https://github.com/birdcar/birdhouse"
  version "0.1.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-darwin-arm64"
      sha256 "f2a0e350f39b6e4d37b63cd4b9101057850767e602ea8c51a89e886963156b2b"
    end
    on_intel do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-darwin-x64"
      sha256 "1994741c92c8241f4f624a9495cee508488fa5fdbb7e1b48b8811638e3ec753c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-linux-arm64"
      sha256 "6330e1f3a4518cadf4658383dc7380221317801542b613db905866fb018db25f"
    end
    on_intel do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-linux-x64"
      sha256 "7fa0bca02e6a5cd84ab998b02f56da25072aa7982842234e6948cc98a03340f5"
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
