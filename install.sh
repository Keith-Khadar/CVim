# Change to the directory where this script is located
cd "$(dirname "$0")" || { echo "Failed to change directory. Exiting."; exit 1; }

echo "Now in the script's directory: $(pwd)"

# Install nvim
# Just to be safe also make sure neovim isnt installed by apt
sudo apt remove nvim -y
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Add nvim to the path
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc
source ~/.bashrc

# Clean up (remove the tarbell)
sudo rm -f ./nvim-linux-x86_64.tar.gz

# Install Neovim config based off NvChad
sudo apt update && sudo apt upgrade -y
sudo apt install xclip -y

rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
mkdir ~/.config/nvim -p
mv ./{*,.*} ~/.config/nvim/

nvim --headless +"MasonInstall" +qall 

cd ..
rm -d ./KVim

clear

exec bash
