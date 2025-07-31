#!/bin/bash

set -ex

mac_install() {
  xcode-select --install || echo "XCode already installed"

  if which brew; then
    echo 'Homebrew is already installed'
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  echo "Update Homebrew..."
  brew update
}

OS="$(uname -s)"
case "${OS}" in
Darwin*)
  mac_install
  ;;
*)
  echo "Unsupported OS: ${OS}"
  exit 1
  ;;
esac
