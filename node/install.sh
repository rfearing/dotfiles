if test ! $(which spoof)
then
  if test $(which npm)
  then
    sudo npm install spoof -g
  fi
fi

if test ! $(which nvm)
then
  git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
  source ~/.zsh-nvm/zsh-nvm.plugin.zsh
fi
