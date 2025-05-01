# Install `tinymancer-cli` app

**Run:**

```shell
curl -s https://raw.githubusercontent.com/tinymancer/cli/main/install.sh | bash
```

**Output:**

```text
[⇩] Downloading tinymancer-linux-amd64.zip...
[⇩] Downloading checksums...
[🔐] Verifying checksum...
[📦] Extracting...
[⚙] Installing to /usr/local/bin...
[✅] Installed: /usr/local/bin/tinymancer
tinymancer v0.1.0
```

---

# Uninstall `tinymancer-cli` app

**Run:**

```shell
tinymancer uninstall
```

**Output:**

```text
[⚠️] Removing binary at /usr/local/bin/tinymancer...
[!] Retrying with sudo...
[✅] tinymancer has been uninstalled successfully.
```

---

# How to run dev environment 


```shell
go mod tidy
```

```shell
go build -o tinymancer
```


```shell
./tinymancer
./tinymancer --version
./tinymancer uninstall
```
