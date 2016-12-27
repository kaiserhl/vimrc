VIM?=vim
SOURCEDIR=${PWD}

.PHONY: all
all:

.PHONY: install
install:
	@echo "=== install vimrc"
	@if [ ! -f ~/.vim ]; then \
		ln -vsfn $(SOURCEDIR) ~/.vim; \
	fi
	@if [ ! -f ~/.vimrc ]; then \
		ln -vsfn $(SOURCEDIR)/vimrc ~/.vimrc; \
	fi
	@if [ ! -d "bundle" ]; then \
		mkdir -v bundle;  \
	fi
	@if [ ! -d "bundle/vundle" ]; then \
		echo "Installing Vundle (https://github.com/gmarik/vundle) ..."; \
		git clone https://github.com/gmarik/vundle.git bundle/vundle; \
	fi
	$(VIM) +BundleInstall +qall

.PHONY: uninstall
uninstall:
	@echo "=== uninstall vimrc"
	@if [ -e $(HOME)/.vimrc ] && [ $(SOURCEDIR)/vimrc = `readlink ~/.vimrc` ]; then \
		rm -v $(HOME)/.vimrc; \
	fi
	@if [ -e $(HOME)/.vim ] && [ $(SOURCEDIR) = `readlink ~/.vim` ]; then \
		rm -v $(HOME)/.vim; \
	fi

.PHONY: reinstall
reinstall: uninstall install
