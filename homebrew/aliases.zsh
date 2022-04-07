if [[ $OSTYPE == 'darwin'* ]]; then
  # Install and automatically update Brewfile
  function brew_install() {
    brew file brew install $1
  }

  function cask_install() {
    brew file brew install --cask $1
  }
fi