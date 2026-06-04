class MacCleans < Formula
  desc "macOS disk cleanup utility - free 10-50GB"
  homepage "https://github.com/Carme99/MacCleans.sh"
  url "https://github.com/Carme99/MacCleans.sh/archive/refs/tags/v5.4.0.tar.gz"
  sha256 "dfe53a804670a1ccdb51fffdc9c8914d131fd5c856e07730a0c5a7e1954289ee"
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
