class PresenceJam < Formula
  desc "Spotify to Teams Status Sync"
  homepage "https://github.com/Carme99/PresenceJam-Desktop"
  url "https://github.com/Carme99/PresenceJam-Desktop/releases/download/v2.7.1/PresenceJam-macos.dmg"
  sha256 "f18937350e592385d56529568a8a94fbcb346d743601a8eb9344e2867cbfe014"
  version "2.7.1"
  license "MIT"

  # Tauri-built macOS DMG. The DMG handler exposes the mount's root
  # as the buildpath, so the .app bundle is at buildpath/PresenceJam.app
  # and we copy it into the keg.

  def install
    prefix.install "PresenceJam.app"
  end

  test do
    assert_predicate prefix/"PresenceJam.app", :exist?
  end
end
