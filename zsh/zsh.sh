#!/bin/bash
# A simple script to install useful tools


# oh_my_zsh
echo -n "===== Install oh_my_zsh ...... "
if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo "Done"

# syntax highlight
echo -n "===== Install zsh-syntax-highlighting ...... "
if [[ ! -d "${HOME}/.zsh/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.zsh/zsh-syntax-highlighting
    echo "# zsh-syntax-highlighting" >> ${HOME}/.zshrc
    echo "source ${HOME}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
fi
echo "Done"

# zsh autosuggestions
echo -n "===== Install zsh-autosuggestions ...... "
if [[ ! -d "${HOME}/.zsh/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.zsh/zsh-autosuggestions
    echo "# zsh-autoggestions" >> ${HOME}/.zshrc
    echo "source ${HOME}/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${HOME}/.zshrc
fi
echo "Done"