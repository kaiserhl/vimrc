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
    Bundle 'editorconfig/editorconfig-vim'
endif
