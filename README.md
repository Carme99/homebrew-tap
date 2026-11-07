# homebrew-tap

Homebrew formulae and casks for Jack's macOS tools.

## Install

```bash
brew tap carme99/tap
```

### MacCleans.sh

macOS disk cleanup utility. Frees 10–50 GB by clearing caches, logs and build
artefacts across a wide range of developer toolchains.

```bash
brew install carme99/tap/mac-cleans
mac-cleans --help
```

Formula source: [`mac-cleans.rb`](mac-cleans.rb) · Project: [Carme99/MacCleans.sh](https://github.com/Carme99/MacCleans.sh)

### PresenceJam

Syncs your Spotify playback to your Microsoft Teams status message via the
Microsoft Graph API.

```bash
brew install --cask carme99/tap/presence-jam
```

Cask source: [`Casks/presence-jam.rb`](Casks/presence-jam.rb) · Project: [Carme99/PresenceJam-Desktop](https://github.com/Carme99/PresenceJam-Desktop)

> **Apple Silicon only.** The PresenceJam release matrix builds
> `aarch64-apple-darwin` only, so the cask declares `depends_on arch: :arm64`
> and an Intel Mac will refuse the install rather than receive a bundle that
> cannot run. Requires macOS 10.15 (Catalina) or later.

If you previously installed PresenceJam as a formula, remove it first:

```bash
brew uninstall presence-jam
brew install --cask carme99/tap/presence-jam
```

A tap holding both a formula and a cask of the same name is ambiguous, so the
cask replaced the formula and the old root-level `presence-jam.rb` was removed.
An autostart entry created while the app ran from the Cellar points at the old
keg path and must be re-created (Settings → Start at login).

## Licence

MIT — see [LICENSE](LICENSE). The installed software carries its own licence:
MacCleans.sh is MIT, PresenceJam-Desktop is MIT.
