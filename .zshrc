export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="/Users/carlosv/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git pyenv zsh-syntax-highlighting zsh-autosuggestions osx vi-mode)

source $ZSH/oh-my-zsh.sh

export PATH="/Users/$USER/.pyenv/shims:$PATH"
export PATH="$PATH:/Users/carlosv/.local/bin"
export PATH="$PATH:/Users/carlosv/Library/'Application Support'/Coursier/bin"

eval "$(pyenv virtualenv-init -)"
eval export PATH="/Users/carlosv/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/usr/local/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/carlosv/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/carlosv/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/carlosv/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/carlosv/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true