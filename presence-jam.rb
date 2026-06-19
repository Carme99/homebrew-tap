class PresenceJam < Formula
  desc "Spotify to Teams Status Sync"
  homepage "https://github.com/Carme99/PresenceJam-Desktop"
  url "https://github.com/Carme99/PresenceJam-Desktop/releases/download/v2.7.0/PresenceJam-macos.dmg"
  sha256 "b9429c50ba714408b3b97f6fe1d3c24f2f3369785c17f673bee4da8fdde36bd7"
  version "2.7.0"
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
