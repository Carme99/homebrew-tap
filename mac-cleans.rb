class MacCleans < Formula
  desc "macOS disk cleanup utility - free 10-50GB"
  homepage "https://github.com/Carme99/MacCleans.sh"
  url "https://github.com/Carme99/MacCleans.sh/archive/refs/tags/v5.1.7.tar.gz"
  sha256 "854deb50167f970173b683bc3e333572ef51bd71b1d199ab52a16f6b3173b718"
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
