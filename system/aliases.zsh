# Mac only:
if [[ $OSTYPE == 'darwin'* ]]; then
  # Set PHP, Ruby and Node Version for iTerm2
  function iterm2_print_user_vars() {
    iterm2_set_user_var phpVersion $(php -v | awk '/^PHP/ { print $2 }')
    iterm2_set_user_var rubyVersion $(ruby -v | awk '{ print $2 }')
    iterm2_set_user_var nodeVersion $(node -v)
  }

  # Play Lofi Girl to focus
  function lofi () {
    mpv "https://www.youtube.com/watch?v=jfKfPfyJRdk" --vid=no
  }

  # play yt in terminal with no video
  function listen () {
    mpv $1 --vid=no
  }

  # play yt in terminal with video
  function watch () {
    mpv $1
  }

  # Print out current wifi password
  # $1 = The network name e.g. wifipassword guest_wifi
  function wifipassword () {
    security find-generic-password -ga "$1" | grep "password:"
  }
fi

# Find apps running by port number
# $1 = port
function findbyport() {
	lsof -i tcp:$1
}

# LS directory with some details
alias list='pwd; ls -la'

# Copy text from clipboard without new line:
alias copy="pbpaste | sed 's/\.$/.|/g' | sed 's/^\s*$/|/g' | tr '\n' ' ' | tr '|' '\n' | pbcopy"
# modified from https://superuser.com/a/796341
#   - first sed command: replace end-of-line full stops with '|' delimiter and keep original periods.
#   - second sed command: replace empty lines with same delimiter (e.g.
#     to separate text headings from text)
#   - subsequent tr commands: remove existing newlines; replace delimiter with
#     newlines
