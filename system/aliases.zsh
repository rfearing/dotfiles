# Find apps running by port number
# $1 = port
function findbyport() {
	lsof -i tcp:$1
}

# Print out current wifi password
# $1 = The network name e.g. wifipassword guest_wifi
function wifipassword () {
	security find-generic-password -ga "$1" | grep "password:"
}

# Set PHP, Ruby and Node Version for iTerm2
function iterm2_print_user_vars() {
  iterm2_set_user_var phpVersion $(php -v | awk '/^PHP/ { print $2 }')
  iterm2_set_user_var rubyVersion $(ruby -v | awk '{ print $2 }')
  iterm2_set_user_var nodeVersion $(node -v)
}

# play yt in terminal with no video
function listen () {
  mpv $1 --no-video
}

# play yt in terminal with video
function watch () {
 mpv $1
}

# LS directory with some details
alias list='pwd; ls -la'