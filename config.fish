# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

export http_proxy=http://localhost:3128
export https_proxy=http://localhost:3128

alias vim="env NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"                    
alias nvr="env NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvr"

setxkbmap fr

# Go settings
set -x -U GOPATH $HOME/go
set -x -U GOBIN $GOPATH/bin
set PATH /usr/lib/go-1.10/bin $PATH
set PATH $GOPATH/bin $PATH

#function rgvim
#    set choice (rg -il $argv | fzf -0 -1 --ansi --preview "cat {} | rg $argv --context 3")
#    if [ $choice ]
#        /usr/local/bin/nvim "+/"(to_lower $argv) $choice
#    end
#end
