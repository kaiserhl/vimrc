set nocompatible
filetype on
filetype off

source ~/.vim/functions/util.vim

let mapleader = ","
let maplocalleader = "\\"

if ! exists('g:vimified_packages')
    let g:vimified_packages = ['general', ]
endif

let s:bundle_path=$HOME."/.vim/bundle/"
execute "set rtp+=".s:bundle_path."vundle/"
call vundle#rc()
Bundle 'gmarik/vundle'

" _. General {{{
if count(g:vimified_packages, 'general')
    Bundle 'edsono/vim-matchit'
    Bundle 'scrooloose/nerdtree'
    Bundle 'msanders/snipmate.vim'
    Bundle 'fholgado/minibufexpl.vim'
    Bundle 'mbriggs/mark.vim'
    Bundle 'ervandew/supertab'
    Bundle 'majutsushi/tagbar'
    Bundle 'mrtazz/DoxygenToolkit.vim'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'dradtke/OmniCppComplete'
    Bundle 'taxilian/a.vim'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'kevinw/pyflakes-vim'
endif
