# --------------------------------------------------------------------------------

# update path
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/.config/rofi/scripts
PATH=$PATH:$HOME/.local/bin

export LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export CARD_BL=$(ls /sys/class/backlight/)
export AUTOSWITCH_SILENT=1
export LOCAL_FILES_SERVING_ENABLED=true
export LOCAL_FILES_DOCUMENT_ROOT=/home/bao

# --------------------------------------------------------------------------------

# alias
alias python=python3
alias pip=pip3
alias cl=clear
alias vi=nvim
alias v=nvim
alias bat=batcat
alias ls='exa --no-permissions --no-user --no-time -la --icons -L 1 --no-filesize --group-directories-first -s modified -r'
alias -g ls='exa --no-permissions --no-user --no-time -la --icons -L 1 --no-filesize --group-directories-first -s modified -r'
alias py=python3
alias update='sudo apt update ; sudo apt upgrade -y'

install() {
  sudo apt install $1
}

uit_temp_with_sources_e () {
  mkdir -p "$1"/sources/
  cp ~/Templates/uit.cpp "$1"/sources/main.cpp
  vi "$1"/sources/main.cpp
}

uit_temp_no_sources_e () {
  mkdir -p "$1"/
  cp ~/Templates/uit.cpp "$1"/main.cpp
  vi "$1"/main.cpp
}

uit_temp_with_sources_ne () {
  mkdir -p "$1"/sources/
  cp ~/Templates/uit.cpp "$1"/sources/main.cpp
}

uit_temp_no_sources_ne () {
  mkdir -p "$1"/
  cp ~/Templates/uit.cpp "$1"/main.cpp
}

compe () {
  mkdir -p "$1"/
  cp ~/Templates/cp.cpp "$1"/main.cpp
  vi "$1"/main.cpp
}

# --------------------------------------------------------------------------------

# enviroments
source ~/.variables.zsh

# --------------------------------------------------------------------------------

# fzf
export FZF_COMPLETION_OPTS='--border --info=inline'
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
    export FZF_CTRL_T_COMMAND='rg --files --hidden'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --------------------------------------------------------------------------------

# antigen
# bindkey '\t' autosuggest-accept

source ~/.antigen.zsh

antigen use oh-my-zsh
antigen bundle joshskidmore/zsh-fzf-history-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
# antigen theme spaceship-prompt/spaceship-prompt
antigen bundle sunlei/zsh-ssh
antigen apply

eval "$(starship init zsh)"


# ---------------------------------------------------------------

# commands
push_dotfiles() {
  cd ~;
  git --git-dir=.git-dotfiles add .zshrc .Xresources .config/nvim/ .config/alacritty .config/rofi .config/bspwm .config/polybar .config/sxhkd .tmux.conf .config/dunst/ .config/ranger ~/.config/pycodestyle ~/.local/bin/scripts/ ~/.local/bin/themes/ ~/.config/flameshot/ ~/.tmux ~/.config/betterlockscreenrc ~/.config/picom/ README.md ~/.imgs_dot/ ~/.config/mini-lightdm ~/.config/zathura/ ~/.config/gtk-3.0/ ~/.config/starship.toml;
  git --git-dir=.git-dotfiles commit -m "$1";
  git --git-dir=.git-dotfiles push origin main;
  cd -;
}

connect_openvpn() {
  openvpn --config ~/Documents/CLBAI/OpenVPN/pfsense4-udp4-1195-config.ovpn;
}

alias ls='exa --no-permissions --no-user --no-time -a --icons --no-filesize --group-directories-first -s modified -r'
alias -g ls='exa --no-permissions --no-user --no-time -a --icons --no-filesize --group-directories-first -s modified -r'

if [[ -t 0 && $- = *i* ]]
then
    stty -ixon
fi
