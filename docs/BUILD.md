## ✅ Build binaries into `dist/` directory

```bash
mkdir -p dist

# Build for Linux x86_64 (amd64)
GOOS=linux GOARCH=amd64 go build -o dist/tinymancer-linux-amd64

# Build for Linux ARM64 (optional)
GOOS=linux GOARCH=arm64 go build -o dist/tinymancer-linux-arm64
```

---

## ✅ Verify output

```bash
ls -lh dist/
# You should see:
# dist/tinymancer-linux-amd64
# dist/tinymancer-linux-arm64
```

---

## ✅ Upload to GitHub Release

1. Go to [GitHub Releases](https://github.com/tinymancer/cli/releases)
2. Open release `v0.1.0`
3. Click “Edit”
4. Under “Assets”, attach both files from the `dist/` directory
5. Click **“Update release”**

---

Let me know if you want a **Makefile** or a release **script** to automate this.
