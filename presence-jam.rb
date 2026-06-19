class PresenceJam < Formula
  desc "Spotify to Teams Status Sync"
  homepage "https://github.com/Carme99/PresenceJam-Desktop"
  url "https://github.com/Carme99/PresenceJam-Desktop/releases/download/v2.7.1/PresenceJam-macos.dmg"
  sha256 "f18937350e592385d56529568a8a94fbcb346d743601a8eb9344e2867cbfe014"
  version "2.7.1"
  license "MIT"

  # Tauri-built macOS DMG. The Tauri 2.x bundler wraps the .app bundle
  # in an outer `PresenceJam/` subfolder (along with an `Applications`
  # symlink for the drag-to-install UX), so the mount-root layout is:
  #
  #   /Volumes/PresenceJam/         (the volume, --volname PresenceJam)
  #     PresenceJam/                (outer subfolder, Tauri bundler quirk)
  #       PresenceJam.app/          ← what we want
  #       Applications              (symlink to /Applications)
  #
  # Verified by extracting the v2.7.1 DMG with 7z — the .app is one
  # level deeper than the original formula expected. The original
  # `prefix.install "PresenceJam.app"` failed with `Errno::ENOENT`
  # because it was looking at the buildpath root, not the subfolder.
  # This latent bug has existed since the formula was first added in
  # #58 (v2.6.0 era). Same issue applies to all earlier versions
  # (v2.6.0 - v2.7.1) — the formula was never tested via actual
  # brew install until Jack tried v2.7.1.

  def install
    prefix.install "PresenceJam/PresenceJam.app"
  end

  test do
    assert_predicate prefix/"PresenceJam.app", :exist?
  end
end
