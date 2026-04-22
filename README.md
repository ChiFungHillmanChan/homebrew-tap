# homebrew-tap

Homebrew tap for apps by [@ChiFungHillmanChan](https://github.com/ChiFungHillmanChan).

## Install

```bash
brew install --cask chifunghillmanchan/tap/scene
```

This automatically taps `chifunghillmanchan/tap` on first use.

## Casks

| Cask | Description | Source |
|------|-------------|--------|
| `scene` | Menu bar workspaces + window layout manager for macOS | [macbook-resizer](https://github.com/ChiFungHillmanChan/macbook-resizer) |

## Updating

```bash
brew update
brew upgrade --cask scene
```

## Uninstall

```bash
brew uninstall --cask scene
brew untap chifunghillmanchan/tap    # optional
```

## Notes

Casks in this tap are **Developer ID signed and notarized by Apple** (since
Scene v0.5.0), so the DMG installs without any Gatekeeper warning. You'll
still need to grant any runtime permissions the app requests (Accessibility,
Automation, etc.) the first time it launches.

Scene v0.5.3+ ships as a **universal binary** (arm64 + x86_64), so the same
cask installs natively on both Apple Silicon and Intel Macs.
