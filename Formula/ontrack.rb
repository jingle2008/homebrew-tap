class Ontrack < Formula
  desc "CLI for the OnTrack deadline and work tracking app"
  homepage "https://github.com/jingle2008/ontrack"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jingle2008/ontrack/releases/download/v0.1.0/ontrack-darwin-arm64.tar.gz"
      sha256 "ec9a7f16312dd721e3d1cabcb08074f1b0b5b349d8fcb08b005ccd7254ebb1aa"
    else
      url "https://github.com/jingle2008/ontrack/releases/download/v0.1.0/ontrack-darwin-amd64.tar.gz"
      sha256 "1320971bc54d7ae80aebbc2ead62ea85bcdd833bc931bfed31339977a812bab2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jingle2008/ontrack/releases/download/v0.1.0/ontrack-linux-arm64.tar.gz"
      sha256 "0f6b09da05d408298ee407be41538ba83aa19dfc4abbaae42488bf55c1ec3e3b"
    else
      url "https://github.com/jingle2008/ontrack/releases/download/v0.1.0/ontrack-linux-amd64.tar.gz"
      sha256 "f840a79ed229a08834dc65f7746868b71d3267b4a726288c4115fe4596678417"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "ontrack-darwin-arm64" => "ontrack"
      else
        bin.install "ontrack-darwin-amd64" => "ontrack"
      end
    else
      if Hardware::CPU.arm?
        bin.install "ontrack-linux-arm64" => "ontrack"
      else
        bin.install "ontrack-linux-amd64" => "ontrack"
      end
    end
  end

  test do
    assert_match "CLI for the OnTrack", shell_output("#{bin}/ontrack --help")
  end
end
