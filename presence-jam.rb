class PresenceJam < Formula
  desc "Spotify to Teams Status Sync"
  homepage "https://github.com/Carme99/PresenceJam-Desktop"
  url "https://github.com/Carme99/PresenceJam-Desktop/releases/download/v2.7.1/PresenceJam-macos.dmg"
  sha256 "f18937350e592385d56529568a8a94fbcb346d743601a8eb9344e2867cbfe014"
  version "2.7.1"
  license "MIT"

  # Tauri-built macOS DMG. brew mounts the DMG, extracts the .app
  # bundle to a temp dir, and chdirs INTO the .app — so the
  # formula's `buildpath` IS the .app bundle itself, with the
  # bundle's contents (Contents/MacOS, Contents/Resources,
  # Contents/Info.plist) sitting directly at buildpath.
  #
  # The install block must therefore copy the buildpath (the .app
  # bundle) into the keg as prefix/PresenceJam.app.
  #
  # Earlier attempts:
  #   - prefix.install "PresenceJam.app"           → buildpath/PresenceJam.app doesn't exist
  #   - prefix.install "PresenceJam/PresenceJam.app" → same reason
  #   - prefix.install buildpath                   → Errno::ENOENT @ dir_initialize
  #     on the buildpath. The buildpath IS supposed to be openable
  #     as a dir (it's the .app bundle), but Ruby's Pathname#install
  #     fails. Falling back to FileUtils.cp_r with explicit string
  #     paths which avoids Pathname's odd behaviour here.
  #
  # See commit 531c6da for the diagnostic that revealed the layout
  # and commit 0d289a1 (this fix) for the final form.

  def install
    raise "buildpath not set" unless buildpath
    raise "buildpath does not exist: #{buildpath}" unless buildpath.exist?
    raise "buildpath is not a directory: #{buildpath}" unless buildpath.directory?

    # buildpath is the .app bundle. Install it as prefix/PresenceJam.app.
    dest = prefix / buildpath.basename
    FileUtils.cp_r buildpath.to_s, dest.to_s
  end

  test do
    assert_predicate prefix/"PresenceJam.app", :exist?
  end
end
