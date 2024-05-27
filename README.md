# Installation
You can follow the guide or use the `setup.sh` on linux

[Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip) - Remember to install for all users for the terminal to find the font 

# Linux
## Font
`sudo cp -vf *.ttf /usr/share/fonts`

## Dependencies
`sudo snap install --beta nvim --classic` \
`sudo apt-get install gcc ripgrep unzip` \
`cargo install tree-sitter-cli` or `npm install tree-sitter-cli`

## Config
`git clone git@github.com:NiclasGH/NeoVim-Configurations.git ~/.config/nvim`

# Windows
## Dependencies
`choco install neovim` \
`choco install llvm` \
`choco install ripgrep`

## Config
`git clone git@github.com:NiclasGH/NeoVim-Configurations.git $env:LOCALAPPDATA\nvim`
