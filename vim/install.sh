# Workspaces:
if [ -d "/workspaces" ]; then
	# Install vim if not installed
	if ! hash vim 2>/dev/null; then
		sudo apt-get update
		yes Y | sudo apt-get install vim
	fi

	mkdir -p ~/.vim/colors/
	mkdir -p ~/.vim/bundle/
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s /workspaces/.codespaces/.persistedshare/dotfiles/vim/monokai.vim ~/.vim/colors/monokai.vim

# Mac:
else
  # Vundle
	if [ ! -d ~/.vim/bundle/Vundle.vim ]
	then
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi

	# Colors
	if [ ! -f ~/.vim/colors/monokai.vim ]
	then
		mkdir -p ~/.vim/colors/
		ln -nsf ~/.dotfiles/vim/monokai.vim ~/.vim/colors/monokai.vim
	fi
fi
