# Change to the directory where this script is located
cd "$(dirname "$0")" || { echo "Failed to change directory. Exiting."; exit 1; }

echo "Now in the script's directory: $(pwd)"

# Install nvim
# Just to be safe also make sure neovim isnt installed by apt
sudo apt remove nvim -y
sudo apt-get remove neovim -y
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Add nvim to the path
echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> ~/.bashrc
source ~/.bashrc

# Clean up (remove the tarbell)
sudo rm -f ./nvim-linux-x86_64.tar.gz

# Install necessary dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install xclip -y
sudo apt install ripgrep
sudo apt install shellcheck

# Install Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

nvm install node
nvm use node

# Remove any old configs
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

# Move this config over
mkdir ~/.config/nvim -p
mv ./{*,.*} ~/.config/nvim/

# Update all packages and LSPs
nvim --headless "+Lazy! sync" +qa
nvim --headless +"MasonInstall" +qall 

# Clean up leftover directories
cd ..
rm -d ./KVim

clear

exec bash 
