ps1_aws()
{
  if [[ $AWS_PROFILE ]]; then
    printf " \[\033[81m\]AWS:$AWS_PROFILE\[\033[0m\]"
  fi
}

if [[ "$(uname)" == "Darwin" ]]; then
  source $(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh
  export KUBE_PS1_NS_ENABLE=true
  export KUBE_PS1_PREFIX=" ("
  export KUBE_PS1_DIVIDER="/"
  export KUBE_PS1_SYMBOL_ENABLE=false
  export KUBE_PS1_SYMBOL_USE_IMG=true
fi

function prompt_callback {
  echo -n "$(ps1_aws)$(kube_ps1)"
}

GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized
source "$HOME/.bash-git-prompt/gitprompt.sh"
