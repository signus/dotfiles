# ~/.config/zsh/.zshrc

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

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
