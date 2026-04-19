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

Casks in this tap are **ad-hoc signed**, not notarized by Apple. The `postflight`
step in each cask removes the quarantine flag automatically, so you won't hit
the Gatekeeper "cannot be verified" warning. You'll still need to grant any
runtime permissions the app requests (Accessibility, Automation, etc.)
the first time.
