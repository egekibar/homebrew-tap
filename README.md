# egekibar/tap

Homebrew tap for [Shotcue](https://github.com/egekibar/Shotcue) and [Clipshot](https://github.com/egekibar/Clipshot).

```bash
brew install --cask egekibar/tap/shotcue
brew install --cask egekibar/tap/clipshot
```

Both require macOS 26 (Tahoe) on Apple silicon. They are not notarized, so the casks clear the quarantine flag after
installing. Both update themselves from GitHub Releases; `brew upgrade --greedy` also works.
