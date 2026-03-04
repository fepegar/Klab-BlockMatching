# Installation

## Quick install (recommended)

Run the installer script, which automatically detects your platform,
downloads the latest release, and installs the binaries under `~/.local/bin`:

```bash
curl -fsSL https://raw.githubusercontent.com/fepegar/Klab-BlockMatching/master/install.sh | bash
```

Make sure `~/.local/bin` is in your `PATH`. Add this to your shell profile
(e.g., `~/.bashrc` or `~/.zshrc`) if it isn't already:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

### Custom install directory

You can set a custom install directory with the `INSTALL_DIR` environment
variable:

```bash
curl -fsSL https://raw.githubusercontent.com/fepegar/Klab-BlockMatching/master/install.sh | INSTALL_DIR=/usr/local/bin bash
```

### Specific version

By default, the script installs the latest release. To install a specific
version:

```bash
curl -fsSL https://raw.githubusercontent.com/fepegar/Klab-BlockMatching/master/install.sh | VERSION=v0.1.0 bash
```

## macOS Gatekeeper

On macOS, you may see a warning:

> "blockmatching" can't be opened because Apple cannot check it for malicious software.

The binaries are not code-signed. Remove the quarantine attribute after
installation:

```bash
xattr -r -d com.apple.quarantine ~/.local/bin/blockmatching
```

Or for all installed binaries at once:

```bash
xattr -r -d com.apple.quarantine ~/.local/bin/{blockmatching,applyTrsf,composeTrsf,invTrsf,cropImage,createTrsf,createGrid,copyTrsf,interpolateImages,intermediaryTrsf,applyTrsfToPoints,pointmatching,buildPyramidImage,printImage,printTrsf}
```

The install script does this automatically.

## Manual installation

1. Download the archive for your platform from the
   [Releases](https://github.com/fepegar/Klab-BlockMatching/releases) page.
2. Extract the archive:
   ```bash
   tar xzf klab-blockmatching-*.tar.gz
   ```
3. Move the binaries to a directory in your `PATH`:
   ```bash
   mv blockmatching applyTrsf composeTrsf ... ~/.local/bin/
   ```
