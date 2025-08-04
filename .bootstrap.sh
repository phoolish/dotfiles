#!/bin/bash

set -e

[ -f ~/.chezmoi-setup ] && exit 0

mac_install() {
  # Update default shell to /bin/bash
  chsh -s /bin/bash

  xcode-select --install || echo "XCode already installed"

  # Rosetta 2 enables a Mac with Apple silicon to use apps that were built for a Mac with an Intel processor.
  sudo softwareupdate --install-rosetta --agree-to-license

  if which brew; then
    echo 'Homebrew is already installed'
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  echo "Update Homebrew..."
  brew update

  # Wipe all (default) app icons from the Dock
  # This is only really useful when setting up a new Mac, or if you don’t use
  # the Dock to launch apps.
  defaults write com.apple.dock persistent-apps -array
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

echo "# This file was created while setting up this computer using chezmoi" > ~/.chezmoi-setup
