export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Ensure a non-login, non-interactive shall has a defined environment
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Disable Homebrew analytics if installed
#[[ -z $(which brew) ]] || export HOMEBREW_NO_ANALYTICS=1

#XDG_CONFIG_HOME
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GIT_CONFIG="$XDG_CONFIG_HOME/git/config"
export KUBECONFIG="$XDG_CONFIG_HOME/kube/kubeconfig.yaml"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
export TFENV_CONFIG_DIR="$XDG_CONFIG_HOME/tfenv"

#XDG_CACHE_HOME
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"

#XDG_DATA_HOME
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export JUPYTER_CONFIG_DIR="$XDG_DATA_HOME/jupyter"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME/vagrant/aliases"

# other
. "/home/signus/.local/share/cargo/env"
export WIRELEAP_PATH="$HOME/.local/bin/wireleap"
