class PresenceJam < Formula
  desc "Spotify to Teams Status Sync"
  homepage "https://github.com/Carme99/PresenceJam-Desktop"
  url "https://github.com/Carme99/PresenceJam-Desktop/releases/download/v4.5.1/PresenceJam-macos.dmg"
  sha256 "802d5a4249943d64f6f22f61ba70fd65eb89233b227dc51447f4d470481d3c75"
  version "4.5.1"
  license "MIT"

  # Tauri-built macOS DMG. brew mounts the DMG, extracts the .app
  # bundle to a temp dir, and chdirs INTO the .app — so the
  # formula's `buildpath` IS the .app bundle itself, with the
  # bundle's contents (Contents/MacOS, Contents/Resources,
  # Contents/Info.plist) sitting directly at buildpath.
  #
  # Earlier attempts:
  #   - prefix.install "PresenceJam.app"             → buildpath/PresenceJam.app doesn't exist
  #   - prefix.install "PresenceJam/PresenceJam.app"  → same reason
  #   - prefix.install buildpath                      → Errno::ENOENT @ dir_initialize
  # Final form: FileUtils.cp_r with explicit string paths. Verifies
  # buildpath exists first so a clear error surfaces if the layout
  # ever changes. See carme99/homebrew-tap commit 71777f3.

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
