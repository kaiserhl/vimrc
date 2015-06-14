GIT?=git
LN?=ln
MKDIR?=mkdir
VIM?=vim
INSTALLDIR=${PWD}

.PHONY: all install uninstall reinstall

all:

install:
	@if [ ! -f ~/.vim ]; then \
		${LN} -vsfn ${INSTALLDIR} ~/.vim; \
	fi
	@if [ ! -f ~/.vimrc ]; then \
		${LN} -vsfn ${INSTALLDIR}/vimrc ~/.vimrc; \
	fi
	@if [ ! -d "bundle" ]; then \
		${MKDIR} -v bundle;  \
	fi
	@if [ ! -d "bundle/vundle" ]; then \
		echo "Installing Vundle (https://github.com/gmarik/vundle) ..."; \
		${GIT} clone https://github.com/gmarik/vundle.git bundle/vundle; \
	fi
	${VIM} +BundleInstall +qall

uninstall:
	@if [ -e ${HOME}/.vimrc ] && [ ${INSTALLDIR}/vimrc = `readlink ~/.vimrc` ]; then \
		rm -v ${HOME}/.vimrc; \
	fi
	@if [ -e ${HOME}/.vim ] && [ ${INSTALLDIR} = `readlink ~/.vim` ]; then \
		rm -v ${HOME}/.vim; \
	fi

reinstall: uninstall install
