# Installation
Simply run nvim with this config cloned
Linux
`git clone git@github.com:NiclasGH/NeoVim-Configurations.git ~/.config/nvim`

Windows
`git clone git@github.com:NiclasGH/NeoVim-Configurations.git $env:LOCALAPPDATA\nvim`

## Known dependencies
### Font
Install the [Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip). Should be installed as admin on windows. Linux can use:

```bash
wget -O font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip font.zip -d fonts
sudo cp -vf fonts/*.ttf /usr/share/fonts
```

### Libs
- gcc
- ripgrep
- python3-venv
- tree-sitter-cli
- maven (for java language server)

**Linux**
```bash
sudo apt-get install gcc ripgrep unzip python3-venv
cargo install tree-sitter-clim
```

**Windows**
```
choco install neovim llvm ripgrep python3-venv
```

### WSL
If you're using WSL you will need a separate clipboard manager. For this you need to install win32yank on your windows: `winget install win32yank`


# Known and good language servers
## Rust
rust-analyzer

## Lua
lua-language-server

## Python
pyright

## Java
jdtls

## Kotlin
kotlin-language-server

## Bash
bash-language-server

