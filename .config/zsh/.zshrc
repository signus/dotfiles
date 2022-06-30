if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
setopt histignorealldups sharehistory
setopt NO_globalrcs

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

HISTSIZE=10000
SAVEHIST=1000
HISTFILE="$XDG_STATE_HOME/zsh/history"


if [ -f $HOME/.aliases ]; then
    source ~/.aliases
fi

if [ -e "$HOME/.local/bin/wireleap/completion.bash" ]; then
    autoload compinit && compinit
    autoload bashcompinit && bashcompinit
    source "$HOME/.local/bin/wireleap/completion.bash"
fi


export GPG_TTY=$(tty)

# add ASDF zsh completions
. $HOME/.asdf/asdf.sh
