if [[ "$(uname)" == "Darwin" ]]; then
  if [ -f "$(brew --prefix asdf)/libexec/asdf.sh" ]; then
    source $(brew --prefix asdf)/libexec/asdf.sh
  fi
fi
