# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#PATH
export PATH="/home/andrew/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/home/andrew/miniconda/bin:$PATH"
export PATH="/home/andrew/miniconda3/bin:$PATH"
export PATH="/home/andrew/.local/bin:$PATH"
export PATH="/home/andrew/.local/bin/scripts:$PATH"
export TERMINFO=/usr/share/terminfo

# Variables
CFLAGS='-Wall -Werror -Wextras'

#ALIAS
alias ls='eza --icons -l --git'
alias ll='eza --icons -l -a --git'
alias lr='eza --icons -R --level=2 --git'
alias lt='eza --icons --tree --level=2 --git'
alias vimf='vim $(fzf -m --height=40%)'
alias "cc"='cc \${CFLAGS}'

# Plugins
source ~/archrice/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/archrice/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/archrice/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/archrice/zsh/zsh-vim-mode/zsh-vim-mode.zsh

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
alias history="history 0"


# zsh-completions
autoload -U compinit && compinit
fpath=(~/.config/zsh/zsh-completions-git/src $fpath)

# Zoxide
eval "$(zoxide init zsh)"

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andrew/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andrew/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andrew/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andrew/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#neofetch
fastfetch

 eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
