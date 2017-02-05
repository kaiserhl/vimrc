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
	@if [ -e $(HOME)/.vimrc ] && [ $(PWD)/vimrc = `readlink ~/.vimrc` ]; then \
		rm -v $(HOME)/.vimrc; \
	fi
	@if [ -e $(HOME)/.vim ] && [ $(PWD) = `readlink ~/.vim` ]; then \
		rm -v $(HOME)/.vim; \
	fi

.PHONY: reinstall
reinstall: uninstall install
