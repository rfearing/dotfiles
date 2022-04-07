if [ -d "/workspaces" ]; then
	if ! hash vim 2>/dev/null; then
		sudo apt-get update
		yes Y | sudo apt-get install vim
	fi

	mkdir ~/.vim
	mkdir ~/.vim/colors/
	mkdir ~/.vim/bundle/
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s /workspaces/.codespaces/.persistedshare/dotfiles/vim/monokai.vim ~/.vim/colors/monokai.vim
else
 	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	mkdir ~/.vim/colors/
	ln -s ~/.dotfiles/vim/monokai.vim ~/.vim/colors/monokai.vim
fi
