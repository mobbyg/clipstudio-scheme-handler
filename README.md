# Clip Studio Scheme Handler (Linux)

A native Linux `x-scheme-handler` that enables **clipstudio://** asset download links to work correctly when running Clip Studio through Bottles.

If clicking “Download” on Clip Studio Assets does nothing on Linux — this project fixes that.

---

## ✨ Features

- Registers handler for `clipstudio://` URLs
- Forwards downloads into Bottles Clip Studio
- Auto-launches Clip Studio if needed
- Prevents duplicate download triggers
- Works with Flatpak Bottles setups
- Lightweight shell implementation

---

## 🧩 How It Works

When you click a Clip Studio Asset download link:

1. Linux dispatches the `clipstudio://` URL
2. The handler captures the URL
3. The worker forwards it into the Bottles environment
4. Clip Studio receives the download request

Behavior closely mirrors Windows.

---

## ✅ Requirements

You must have:

- Flatpak
- Bottles (`com.usebottles.bottles`)
- A bottle named **Clip Studio**
- A program entry named **CLIPStudio**

⚠️ Names are case-sensitive.

---

## 📦 Installation

Download the `.deb` from Releases, then:

```bash
sudo dpkg -i clipstudio-scheme-handler_*_all.deb
sudo update-desktop-database /usr/share/applications


Verify:

gio mime x-scheme-handler/clipstudio

Test:

gio open "clipstudio://test"
🧪 Logs

Logs are written to:

~/.cache/clipstudio/

Important files:

handler.log

worker.script.log

These are very helpful when troubleshooting.

🐛 Known Limitations

Designed for Bottles Flatpak environments

Assumes standard Clip Studio install inside the bottle

Not yet tested with non-Bottles Wine setups

🤝 Contributing

Issues and pull requests are welcome — especially for:

Non-Flatpak Bottles setups

Lutris support

Pure Wine support

Better auto-detection of bottle/program names

📜 License

MIT (or choose your preferred license)

❤️ Acknowledgements

Thanks to the Linux art community and Bottles project for making Clip Studio on Linux possible.
