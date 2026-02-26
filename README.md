cat > README.md <<'EOF'
# clipstudio-scheme-handler (Linux + Bottles)

Open `clipstudio://` links from the Clip Studio Assets site on Linux by forwarding them into a Bottles-installed Clip Studio.

This installs a URL scheme handler for:

- `x-scheme-handler/clipstudio`

…and launches/forwards the URL into a Bottles bottle (default: `Clip Studio`).

## Requirements

- Bottles (Flatpak): `com.usebottles.bottles`
- A bottle named **Clip Studio**
- Clip Studio installed in that bottle
- A desktop environment that respects `xdg-mime` / `gio`

## Install (Debian/Ubuntu)

Download the `.deb` from Releases and:

```bash
sudo dpkg -i clipstudio-scheme-handler_1.0.0_all.deb
sudo update-desktop-database /usr/share/applications
