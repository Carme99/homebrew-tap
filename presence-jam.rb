class PresenceJam < Formula
  desc "Spotify to Teams Status Sync"
  homepage "https://github.com/Carme99/PresenceJam-Desktop"
  url "https://github.com/Carme99/PresenceJam-Desktop/releases/download/v2.7.1/PresenceJam-macos.dmg"
  sha256 "f18937350e592385d56529568a8a94fbcb346d743601a8eb9344e2867cbfe014"
  version "2.7.1"
  license "MIT"

  # Tauri-built macOS DMG. brew mounts the DMG and then cd's INTO the
  # .app bundle, setting buildpath = the .app bundle itself (e.g.
  # /private/tmp/presence-jam-XXXXXXXX-XXXXX/PresenceJam.app/).
  # The .app's contents (Contents/MacOS, Contents/Resources,
  # Contents/Info.plist) sit directly at buildpath.
  #
  # Diagnosed by adding diagnostic output on v2.7.1: brew reported
  # buildpath contents as just "Contents/". The original formula
  # tried `prefix.install "PresenceJam.app"` which would have looked
  # for buildpath/PresenceJam.app — i.e. inside the bundle.
  # Unsurprisingly, ENOENT. The fix is to install the entire
  # buildpath (the .app bundle itself) into the keg.

  def install
    prefix.install buildpath
  end

  test do
    assert_predicate prefix/"PresenceJam.app", :exist?
  end
end
