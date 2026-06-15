class PresenceJam < Formula
  desc "Spotify to Teams Status Sync"
  homepage "https://github.com/Carme99/PresenceJam-Desktop"
  url "https://github.com/Carme99/PresenceJam-Desktop/releases/download/v2.6.4/PresenceJam-macos.dmg"
  sha256 "89c1c1d920a4b8026ea1232730a8e3c20df7f13823c36fb3402724d0db2bad13"
  version "2.6.4"
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
