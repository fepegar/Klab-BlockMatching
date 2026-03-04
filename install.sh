#!/usr/bin/env bash
set -euo pipefail

REPO="fepegar/Klab-BlockMatching"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
VERSION="${VERSION:-latest}"

detect_platform() {
  local os arch
  os="$(uname -s)"
  arch="$(uname -m)"

  case "$os" in
    Linux)
      case "$arch" in
        x86_64) echo "linux-x86_64" ;;
        *) echo "Unsupported architecture: $arch" >&2; exit 1 ;;
      esac
      ;;
    Darwin)
      case "$arch" in
        arm64) echo "macos-arm64" ;;
        x86_64) echo "macos-x86_64" ;;
        *) echo "Unsupported architecture: $arch" >&2; exit 1 ;;
      esac
      ;;
    *) echo "Unsupported OS: $os" >&2; exit 1 ;;
  esac
}

get_download_url() {
  local platform="$1"
  local artifact="klab-blockmatching-${platform}.tar.gz"

  if [ "$VERSION" = "latest" ]; then
    echo "https://github.com/${REPO}/releases/latest/download/${artifact}"
  else
    echo "https://github.com/${REPO}/releases/download/${VERSION}/${artifact}"
  fi
}

main() {
  local platform url tmpdir

  platform="$(detect_platform)"
  url="$(get_download_url "$platform")"

  echo "Detected platform: ${platform}"
  echo "Installing to: ${INSTALL_DIR}"
  echo "Downloading from: ${url}"

  tmpdir="$(mktemp -d)"
  trap 'rm -rf "$tmpdir"' EXIT

  curl -fsSL "$url" -o "$tmpdir/archive.tar.gz"
  tar xzf "$tmpdir/archive.tar.gz" -C "$tmpdir"

  mkdir -p "$INSTALL_DIR"
  find "$tmpdir" -maxdepth 1 -type f -perm +111 -exec cp {} "$INSTALL_DIR/" \;

  # Remove macOS quarantine attribute if on macOS
  if [ "$(uname -s)" = "Darwin" ]; then
    find "$INSTALL_DIR" -maxdepth 1 -type f -newer "$tmpdir/archive.tar.gz" \
      -exec xattr -d com.apple.quarantine {} \; 2>/dev/null || true
  fi

  echo ""
  echo "Installation complete!"
  echo ""
  if ! echo "$PATH" | tr ':' '\n' | grep -qx "$INSTALL_DIR"; then
    echo "Add ${INSTALL_DIR} to your PATH:"
    echo "  export PATH=\"${INSTALL_DIR}:\$PATH\""
    echo ""
  fi
  echo "Try running: blockmatching --help"
}

main
