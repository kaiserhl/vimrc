VIM?=vim

.PHONY: all
all:

.PHONY: install
install:
	@echo "=== install vimrc"
	@if [ ! -f ~/.vim ]; then \
		ln -vsfn $(PWD) ~/.vim; \
	fi
	@if [ ! -f ~/.vimrc ]; then \
		ln -vsfn $(PWD)/vimrc ~/.vimrc; \
	fi
	@if [ ! -f "autoload/plug.vim" ]; then \
		echo "Installing Vundle (https://github.com/gmarik/vundle) ..."; \
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi
	$(VIM) +PlugInstall +qall

.PHONY: uninstall
uninstall:
	@echo "=== uninstall vimrc"
	@if [ -e $(HOME)/.vimrc ] && [ $(PWD)/vimrc = `readlink ~/.vimrc` ]; then \
		rm -v $(HOME)/.vimrc; \
	fi
	@if [ -e $(HOME)/.vim ] && [ $(PWD) = `readlink ~/.vim` ]; then \
		rm -v $(HOME)/.vim; \
	fi

.PHONY: reinstall
reinstall: uninstall install

.PHONY: install-nvim
install-nvim:
	@echo "=== install vimrc to nvim"
	@if [ ! -d ~/.config ]; then \
		mkdir -p ~/.config; \
	fi
	@if [ ! -f ~/.config/nvim ]; then \
		ln -vsfn $(PWD) ~/.config/nvim; \
	fi
	@if [ ! -f ~/.config/nvim/init.vim ]; then \
		ln -vsfn $(PWD)/vimrc ~/.config/nvim/init.vim; \
	fi
	@if [ ! -f ~/.vim ]; then \
		ln -vsfn $(PWD) ~/.vim; \
	fi
	@if [ ! -d "bundle" ]; then \
		mkdir -v bundle;  \
	fi
	@if [ ! -d "bundle/vundle" ]; then \
		echo "Installing Vundle (https://github.com/gmarik/vundle) ..."; \
		git clone https://github.com/gmarik/vundle.git bundle/vundle; \
	fi
	$(VIM) +BundleInstall +qall

.PHONY: uninstall-nvim
uninstall-nvim:
	@echo "=== uninstall vimrc from nvim"
	@if [ -e $(HOME)/.vim ] && [ $(PWD) = `readlink ~/.vim` ]; then \
		rm -v $(HOME)/.vim; \
	fi
	@if [ -e $(HOME)/.config/nvim/init.vim ] && [ $(PWD)/vimrc = `readlink ~/.config/nvim/init.vim` ]; then \
		rm -v $(HOME)/.config/nvim/init.vim; \
	fi
	@if [ -e $(HOME)/.config/nvim ] && [ $(PWD) = `readlink ~/.config/nvim` ]; then \
		rm -v $(HOME)/.config/nvim; \
	fi

.PHONY: reinstall-nvim
reinstall-nvim: uninstall install
