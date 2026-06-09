class PresenceJam < Formula
  desc "Spotify to Teams Status Sync"
  homepage "https://github.com/Carme99/PresenceJam-Desktop"
  url "https://github.com/Carme99/PresenceJam-Desktop/releases/download/v2.6.1/PresenceJam-macos.dmg"
  sha256 "f431edbb8d252cdd72aaa3456ccf27d9d33e9205b04ccc573f920c119347ce86"
  version "2.6.1"
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
