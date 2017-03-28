all : ~/.emacs.d ~/.tmux.conf 		

~/.emacs.d :
	ln -s ~/dotfiles/emacs.d ~/.emacs.d
~/.tmux.conf :
	ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
