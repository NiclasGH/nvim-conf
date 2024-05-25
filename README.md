# Installation
You can follow the guide or use the `setup.sh` on linux \

[Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip) - Remember to install for all users for the terminal to find the font \

# Linux
To install Font: `sudo cp -vf *.ttf /usr/share/fonts` \
`sudo snap install --beta nvim --classic` \
`sudo apt-get install gcc ripgrep unzip` \
`cargo install tree-sitter-cli` or `npm install tree-sitter-cli` \
`git clone https://github.com/NiclasGH/NeoVim-Configurations.git ~/.config/nvim`

# Windows
`choco install neovim` \
`choco install llvm` \
*optional:* `choco install ripgrep` \
clone this into: `~/AppData/Local/nvim`\
use command in powershell: `git clone https://github.com/NiclasGH/NeoVim-Configurations $env:LOCALAPPDATA\nvim` \

# Basic vim commands:
hjkl - navigation\
iI - starting editing before/start of line \
aA - starting editing after/end of line \
b - last word \
w - next word
