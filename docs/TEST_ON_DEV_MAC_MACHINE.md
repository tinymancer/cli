### Test deletion command on dev environment machine (MACOS)

### Install

```shell
go build -o tinymancer
```

```shell
sudo cp ./tinymancer /usr/local/bin/
```

### Check installation

```shell
which tinymancer
```

### Run `uninstall`

```shell
tinymancer uninstall
```

### Output:

```shell
[⚠️] Removing binary at /usr/local/bin/tinymancer...
[!] Retrying with sudo...
[✅] tinymancer has been uninstalled successfully.
```

