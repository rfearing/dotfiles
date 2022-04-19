if [[ $OSTYPE == 'darwin'* ]]; then
  # Updating this way to keep comments and order as I see fit.
  function dotfiles_insert_above_line() {
    case "$2" in
      "cask")
        endVal="\# End Casks"
      ;;
      "tap")
        endVal="\# End Taps"
        ;;
      *)
        endVal="\# End Brews"
        ;;
    esac

    # Get line number
    lineNum=$(sed -n "/$endVal/=" ~/.dotfiles/homebrew/Brewfile)
    # Copy Brewfile
    cp ~/.dotfiles/homebrew/Brewfile ~/.dotfiles/homebrew/Brewfile.temp
    # Write to Brewfile
    awk 'NR=='$lineNum'{print "'$2' \"'$1'\""}1' ~/.dotfiles/homebrew/Brewfile.temp > ~/.dotfiles/homebrew/Brewfile
    # Remove temp file
    rm ~/.dotfiles/homebrew/Brewfile.temp
  }

  # Install and automatically update Brewfile
  function brew_install() {
    brew install $1
    dotfiles_insert_above_line $1 "brew"
  }

  function cask_install() {
    brew install --cask $1
    dotfiles_insert_above_line $1 "cask"
  }

  function tap_install() {
    brew tap $1
    dotfiles_insert_above_line $1 "tap"
  }
fi
