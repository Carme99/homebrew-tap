class MacCleans < Formula
  desc "macOS disk cleanup utility - free 10-50GB"
  homepage "https://github.com/Carme99/MacCleans.sh"
  url "https://github.com/Carme99/MacCleans.sh/archive/refs/tags/v5.0.tar.gz"
  sha256 "4db3e570502937457ccad5f8e9d9f5ceb96774f840ac003eb234d0eb25247cc6"
  license "MIT"

  def install
    bin.install "clean-mac-space.sh" => "mac-cleans"
    bash_completion.install "completions/mac-cleans.bash"
    zsh_completion.install "completions/_mac-cleans"
    fish_install Completions: "completions/mac-cleans.fish"
  end

  test do
    system "#{bin}/mac-cleans", "--version"
  end
end
