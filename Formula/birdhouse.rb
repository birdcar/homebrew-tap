class Birdhouse < Formula
  desc "CLI tool for managing GitHub workflow templates and daily thread automation"
  homepage "https://github.com/birdcar/birdhouse"
  version "0.1.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-darwin-arm64"
      sha256 "8975053c5cfe4917f2c79fdb1269420691e33a521f454021c33ca5ec4534a15b"
    end
    on_intel do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-darwin-x64"
      sha256 "aaa513c5762f8fab2dd08554f76d8c6626e33f2d21503b20e1080665d960d939"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-linux-arm64"
      sha256 "c55b965133de9b75c4a1dd319c3fff65e3e765becbdabb5f90081bcdf46311ff"
    end
    on_intel do
      url "https://github.com/birdcar/birdhouse/releases/download/v#{version}/bh-linux-x64"
      sha256 "375f94f2c79a7bd3b3a27198375a6ddbbf3ae6e617404140d988bcd33eb3a30a"
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
