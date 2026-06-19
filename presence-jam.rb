class PresenceJam < Formula
  desc "Spotify to Teams Status Sync"
  homepage "https://github.com/Carme99/PresenceJam-Desktop"
  url "https://github.com/Carme99/PresenceJam-Desktop/releases/download/v2.7.1/PresenceJam-macos.dmg"
  sha256 "f18937350e592385d56529568a8a94fbcb346d743601a8eb9344e2867cbfe014"
  version "2.7.1"
  license "MIT"

  # Tauri-built macOS DMG. The HFS+ volume layout has been inconsistent
  # across releases and brew versions — verified that the actual mounted
  # HFS+ root on a Linux-mountable test image contains PresenceJam.app/
  # directly (no subfolder), but the original `prefix.install "PresenceJam.app"`
  # still produced Errno::ENOENT for Jack's brew install on v2.7.1.
  #
  # The fix below probes for the .app at both the documented layouts
  # (root and one-level-deep subfolder), using absolute paths from
  # `buildpath` to be cwd-independent. The `odie` line gives a clear
  # diagnostic if neither layout is found, listing the actual buildpath
  # contents so we can adjust.

  def install
    candidates = [
      buildpath/"PresenceJam.app",
      buildpath/"PresenceJam/PresenceJam.app",
    ]
    app_path = candidates.find(&:directory?)
    unless app_path
      odie <<~EOS
        PresenceJam.app not found at #{buildpath}.
        Buildpath contents:
        #{Dir.glob("#{buildpath}/*").map { |p| "  #{p}" }.join("\n")}
        Expected one of:
          #{candidates.join("\n          ")}
      EOS
    end
    prefix.install app_path
  end

  test do
    assert_predicate prefix/"PresenceJam.app", :exist?
  end
end
