eval "$(starship init zsh)"

# --------------------------------------------------------------------------------

# update path
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/anaconda3/bin
PATH=$PATH:$HOME/.config/rofi/scripts
PATH=$PATH:$HOME/.local/bin
# STARSHIP_CONFIG=~/.config/starship.toml

# --------------------------------------------------------------------------------

# alias
alias python=python3
alias pip=pip3
alias cl=clear
alias vi=nvim

uit_temp () {
  mkdir -p "$1"/sources/
  cp ~/Templates/uit.cpp "$1"/sources/main.cpp
  vi "$1"/sources/main.cpp
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bao/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bao/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bao/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bao/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# commands
push_dotfiles() {
  cd ~;
  git --git-dir=.git-dotfiles add .zshrc .Xresources .config/nvim .config/alacritty .config/bspwm .config/polybar .config/spaceship .config/sxhkd .tmux.conf .tmux run_on_boot.sh;
  git --git-dir=.git-dotfiles commit -m "updated";
  git --git-dir=.git-dotfiles push origin main;
  cd -;
}
