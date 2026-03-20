class MacCleans < Formula
  desc "macOS disk cleanup utility - free 10-50GB"
  homepage "https://github.com/Carme99/MacCleans.sh"
  url "https://github.com/Carme99/MacCleans.sh/archive/refs/tags/v4.3.0.tar.gz"
  sha256 "4862a43bf46580abff1a1ca98a72bc73ef6dfe9dbc614d6134be075c8712faf5"
  license "MIT"

  def install
    bin.install "clean-mac-space.sh" => "mac-cleans"
  end

  test do
    system "#{bin}/mac-cleans", "--version"
  end
end
