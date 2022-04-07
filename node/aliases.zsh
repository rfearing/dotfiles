# Local Application dev environments
export NODE_ENV=development
IS_NVM=$(echo ${NVM_DIR})

# Codespaces loads nvm differently
if [ -d "/workspaces" ]
then
  if [[ -z ${IS_NVM} ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  fi
else
  source ~/.zsh-nvm/zsh-nvm.plugin.zsh
fi

# Calling nvm use automatically in a directory with a .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
# end autoload .nvmrc

# list global npm link modules
alias links='npm ls -g --depth=0 --link=true'

# I know this isn't node... but I'm putting it here:
alias sassy='sass --watch .:. --style compressed'