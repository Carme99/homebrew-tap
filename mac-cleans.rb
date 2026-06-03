class MacCleans < Formula
  desc "macOS disk cleanup utility - free 10-50GB"
  homepage "https://github.com/Carme99/MacCleans.sh"
  url "https://github.com/Carme99/MacCleans.sh/archive/refs/tags/v5.3.0.tar.gz"
  sha256 "c5b98e05f7a16652a4dc35b36e9dd6decbf6aebe886806ae1adae34df420f3d8"
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
