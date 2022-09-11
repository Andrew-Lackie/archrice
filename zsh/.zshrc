# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#API
export QUANDL_API_KEY=KJVpF-jz2gqCwpee__mg
export ALPHAVANTAGE_API_KEY=T3JH1UGZJVPS51XK
export ZIPLINE_ROOT=~/Trading/tradinglib/ML_Trading_Lib/data/zipline

#PATH
export PATH=/home/andrew/.local/share/gem/ruby/3.0.0/bin:$PATH 
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/home/andrew/miniconda/bin:$PATH"
export PATH="/home/andrew/miniconda3/bin:$PATH"
# NNN Configurations
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_PLUG='f:finder;d:diffs;t:nmount;v:imgview;s:-!sudo -E vim $nnn*;p:preview-tabbed'

BLK="04" CHR="04" DIR="04" EXE="00" REG="00" HARDLINK="00" SYMLINK="06" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
# alias ls="nnn -e -d -H"

# Pyenv Virutal Environment
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

#ALIAS
alias ls='colorls -l --sd'
alias "ls -a"='colorls -lA --sd'

# Plugins 
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh 
source ~/.config/zsh/zsh-vim-mode/zsh-vim-mode.zsh
# zsh-completions
autoload -U compinit && compinit
fpath=(~/.config/zsh/zsh-completions-git/src $fpath)
#COLORLS
source $(dirname $(gem which colorls))/tab_complete.sh

# Zoxide
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PAGER="most"

# >>> conda initialize >>>
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
 
