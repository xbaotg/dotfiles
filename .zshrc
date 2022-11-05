eval "$(starship init zsh)"

# --------------------------------------------------------------------------------

# update path
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/.config/rofi/scripts
PATH=$PATH:$HOME/.local/bin

# --------------------------------------------------------------------------------

# alias
alias python=python3
alias pip=pip3
alias cl=clear
alias vi=nvim
alias v=nvim

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

# --------------------------------------------------------------------------------

# enviroments
source ~/.variables.zsh

# --------------------------------------------------------------------------------

# fzf
export FZF_COMPLETION_OPTS='--border --info=inline'
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --------------------------------------------------------------------------------

# antigen
source ~/.antigen.zsh

antigen use oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv
antigen theme spaceship-prompt/spaceship-prompt
antigen apply

# ---------------------------------------------------------------

# commands
push_dotfiles() {
  cd ~;
  git --git-dir=.git-dotfiles add .zshrc .Xresources .config/nvim .config/alacritty .config/rofi .config/bspwm .config/polybar .config/spaceship .config/sxhkd .tmux.conf .config/ranger .tmux ~/screenshots ~/.local/bin/custom_scripts/ README.md;
  git --git-dir=.git-dotfiles commit -m "updated";
  git --git-dir=.git-dotfiles push origin main;
  cd -;
}
