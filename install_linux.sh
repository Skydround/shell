#!/bin/bash

echo "🚀 Rozpoczynam instalację środowiska ZSH..."

# 1. Instalacja pakietów systemowych
sudo apt update && sudo apt install -y zsh curl git fzf python3-pip unzip dos2unix

# 2. Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 3. Oh My Posh
mkdir -p "$HOME/.local/bin"
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d "$HOME/.local/bin"

# 4. Pluginy (Syntax Highlighting & Autosuggestions)
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
rm -rf ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
rm -rf ${ZSH_CUSTOM}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions

# 5. Generowanie .zshrc
cat <<EOT > ~/.zshrc
export PATH="\$HOME/.local/bin:\$PATH"
export ZSH="\$HOME/.oh-my-zsh"

plugins=(
    git z sudo fzf python pip gcloud node npm jsontools 
    zsh-autosuggestions zsh-syntax-highlighting
)

source \$ZSH/oh-my-zsh.sh

# Oh My Posh - Theme: Aliens
eval "\$(oh-my-posh init zsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/aliens.omp.json)"

# Aliasy pod Twój stack
alias vact="source venv/bin/activate"
alias frun="python3 -m flask run"
alias szsh="source ~/.zshrc"

# FZF Key bindings
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
EOT

# 6. Fix dla znaków końca linii (CRLF -> LF)
dos2unix ~/.zshrc

echo "✅ Instalacja zakończona! Wpisz 'zsh' aby zacząć."
