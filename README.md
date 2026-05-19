# homebrew-tap

Official [Homebrew](https://brew.sh) tap for `jingle2008`'s tools. The Formula and Cask files in this repository are generated automatically by [GoReleaser](https://goreleaser.com) on each upstream release.

## Available formulae

| Name | Upstream | Description |
| ---- | -------- | ----------- |
| `toolkit` | [`jingle2008/toolkit`](https://github.com/jingle2008/toolkit) | Cross-platform CLI / TUI / MCP server for cloud & infrastructure automation. |

## Install

```sh
brew install jingle2008/tap/toolkit
```

That one-liner taps the repository and installs the latest release. Equivalent two-step form:

```sh
brew tap jingle2008/tap
brew install toolkit
```

### Cask (pre-built binary, macOS only)

A Cask is provided for users who prefer the pre-built binary path on macOS. Linuxbrew has no Cask support — Linux users always get the Formula.

```sh
brew install --cask jingle2008/tap/toolkit
```

## Supported platforms

| OS    | Architecture            | Path    |
| ----- | ----------------------- | ------- |
| macOS | Intel (`amd64`)         | Cask / Formula |
| macOS | Apple Silicon (`arm64`) | Cask / Formula |
| Linux | Intel (`amd64`)         | Formula |
| Linux | ARM (`arm64`)           | Formula |

## Verify your install

```sh
toolkit version
```

## Upgrade

```sh
brew update
brew upgrade toolkit
```

## Uninstall

```sh
brew uninstall toolkit
brew untap jingle2008/tap
```

## Migrating from `jingle2008/homebrew-toolkit`

The previous per-project tap (`jingle2008/homebrew-toolkit`) is archived from `toolkit`'s point of view as of v0.3.1 and won't receive new releases. Migrate with (order matters — `brew untap` refuses while the formula is still installed):

```sh
brew uninstall toolkit
brew untap jingle2008/toolkit       # canonical short name; the homebrew- prefix is implied
brew install jingle2008/tap/toolkit
```

## Troubleshooting

### macOS: "toolkit cannot be opened" / "developer cannot be verified"

The released binaries are not yet code-signed with a Developer ID, so Gatekeeper quarantines them on first launch. Install normally, then strip the quarantine attribute:

```sh
brew install jingle2008/tap/toolkit
xattr -dr com.apple.quarantine "$(brew --prefix)/bin/toolkit"
```

(Homebrew removed the `--no-quarantine` install switch outright — there is no replacement that suppresses the attribute at install time. The post-install `xattr` is the only documented workaround.)

Code-signing + Apple notarization is wired in the upstream release pipeline and waiting on the operator to provision Apple Developer credentials. See [`docs/release/macos-notarization.md`](https://github.com/jingle2008/toolkit/blob/main/docs/release/macos-notarization.md) for status. Once notarized binaries ship, this section becomes unnecessary.

### `brew install` says "Error: jingle2008/tap/toolkit has no formula"

`brew update` first — the tap is fetched lazily and a freshly-tapped repo sometimes needs an explicit refresh before the formula resolver sees it.

## Reporting issues

- **Bugs / feature requests for the `toolkit` CLI itself** → [`jingle2008/toolkit/issues`](https://github.com/jingle2008/toolkit/issues).
- **Problems specific to installation via Homebrew** → [`jingle2008/homebrew-tap/issues`](https://github.com/jingle2008/homebrew-tap/issues).

## License

Formula and Cask files in this tap are generated automatically by GoReleaser from upstream metadata. Each installed program is distributed under the license declared in its upstream repository (see the *Available formulae* table above).
