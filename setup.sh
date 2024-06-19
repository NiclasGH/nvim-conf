# Nvim + Dependencies
sudo snap install --beta nvim --classic
sudo apt-get install gcc ripgrep unzip python3-venv
cargo install tree-sitter-clim

# Font
wget -O font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip font.zip -d fonts
sudo cp -vf fonts/*.ttf /usr/share/fonts

# Font cleanup
rm -r fonts
rm font.zip
