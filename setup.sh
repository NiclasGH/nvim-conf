# Nvim + Dependencies
sudo snap install --beta nvim --classic
sudo apt-get install gcc ripgrep unzip
cargo install tree-sitter-cli

# Nvim configuration
git clone https://github.com/NiclasGH/NeoVim-Configurations.git ~/.config/nvim

# Font
wget -O font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip font.zip -d fonts
sudo cp -vf fonts/*.ttf /usr/share/fonts

# Font cleanup
rm -r fonts
rm font.zip
