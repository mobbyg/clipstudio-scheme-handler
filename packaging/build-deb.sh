#!/usr/bin/env bash
set -euo pipefail

PKG="clipstudio-scheme-handler"
VER="1.0.0"
ARCH="all"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STAGE="$ROOT/packaging/stage"
OUT="$ROOT/dist/${PKG}_${VER}_${ARCH}.deb"

mkdir -p "$ROOT/dist"
rm -rf "$STAGE"
mkdir -p "$STAGE/DEBIAN" "$STAGE/usr/bin" "$STAGE/usr/share/applications"

install -m 0755 "$ROOT/clipstudio-handler" "$STAGE/usr/bin/clipstudio-handler"
install -m 0755 "$ROOT/clipstudio-worker"  "$STAGE/usr/bin/clipstudio-worker"
install -m 0644 "$ROOT/clipstudio-handler.desktop" "$STAGE/usr/share/applications/clipstudio-handler.desktop"

cat > "$STAGE/DEBIAN/control" <<CONTROL
Package: ${PKG}
Version: ${VER}
Section: utils
Priority: optional
Architecture: ${ARCH}
Maintainer: ${USER} <${USER}@localhost>
Description: x-scheme-handler for clipstudio:// links using Bottles
 Installs a desktop handler for clipstudio:// URLs and forwards them to Clip Studio via Bottles.
CONTROL

cat > "$STAGE/DEBIAN/postinst" <<'POSTINST'
#!/usr/bin/env bash
set -e
if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
fi
POSTINST
chmod 0755 "$STAGE/DEBIAN/postinst"

cat > "$STAGE/DEBIAN/prerm" <<'PRERM'
#!/usr/bin/env bash
set -e
if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database /usr/share/applications >/dev/null 2>&1 || true
fi
PRERM
chmod 0755 "$STAGE/DEBIAN/prerm"

dpkg-deb --root-owner-group --build "$STAGE" "$OUT" >/dev/null
echo "Built: $OUT"
