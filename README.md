# vss install

One line commands to install vss on your system.

Currently, only builds for amd64 are available.

For arm64, clone the https://github.com/vssio/vss and build it.

## Install latest version

With Shell(For Mac & Linux):

```
curl -fsSL https://raw.githubusercontent.com/vssio/vss_install/main/install.sh | sh
```

version specified:
```
curl -fsSL https://raw.githubusercontent.com/vssio/vss_install/main/install.sh | sh -s v0.2.0-beta
```


With PowerShell(for Windows):

```
irm https://raw.githubusercontent.com/vssio/vss_install/main/install.ps1 | iex
```

version specified:
```
$v="v0.2.0-beta.1"; irm https://raw.githubusercontent.com/vssio/vss_install/main/install.ps1 | iex
```

## LICENSE

MIT (see the `LICENSE` file in this repository for more details.)
