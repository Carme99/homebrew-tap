class MacCleans < Formula
  desc "macOS disk cleanup utility - free 10-50GB"
  homepage "https://github.com/Carme99/MacCleans.sh"
  url "https://github.com/Carme99/MacCleans.sh/archive/refs/tags/v5.1.tar.gz"
  sha256 "319f182f929c7a07b74e74723a2c851734939e8ef14bb646834018c9f370feb8"
  license "MIT"

  def install
    bin.install "clean-mac-space.sh" => "mac-cleans"
    bash_completion.install "completions/mac-cleans.bash"
    zsh_completion.install "completions/_mac-cleans"
    (prefix/"fish/completions").install "completions/mac-cleans.fish" if File.exist? "completions/mac-cleans.fish"
  end

  test do
    system "#{bin}/mac-cleans", "--version"
  end
end
