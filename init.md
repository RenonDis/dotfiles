# Installation de nvim

- Prendre la dernière version de neovim :

    Depuis un ppa idéalement, sinon :
> https://packages.debian.org/stretch/amd64/neovim/download


# nvim remote

pip3 install neovim-remote
détail : https://github.com/mhinz/neovim-remote

note : pour travailler sur un serveur distant, monter via sshfs


# Installation des prérequis

- installer vim-plug

- sudo apt install python3 python3-pip
- pip3 install neovim
- pip3 install pynvim (pour deoplete)

- vim-go : follow https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
set -x -U GOPATH $HOME/go
set -x -U GOBIN $GOPATH/bin
set PATH /usr/lib/go-1.10/bin $PATH
set PATH $GOPATH/bin $PATH


- take shortcuts : alias vim=nvim
    - or : alias vim="nvr -s", puis ouvrir d'autres fichiers avec "nvr"

cpp : take a look (here)[https://gist.github.com/rocarvaj/2513367]

# Installation des plugins


- Placer la config dans ~/.config/nvim/init.vim
- Sauvegarder la config
- :source %
- :PlugInstall

# Utilisation du clipboard

- installer le paquet xsel
