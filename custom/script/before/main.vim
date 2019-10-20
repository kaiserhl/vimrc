"""""""""""""""""""""
set encoding=utf-8 " encoding using utf-8
set fileencodings=utf-8

""""""""""""""""""""
set smarttab
set backspace=indent,eol,start " backspacing over everything in insert mode

set formatoptions-=cro
set complete=.,w,b,u,t,k " scan the files used for autocomplete, no 'i'
set popt=left:8pc,right:3pc

set browsedir=current " which directory to use for the file browser

set noswapfile
set nobackup

set noautoindent
set smartindent
set indentexpr=

set autoread " read open files again when changed outside Vim
set autowrite " write a modified buffer on each :next , ...

set visualbell
set noerrorbells

set wildignore=*.bak,*.o,*.e,*~,*.swp,*.bak,*.pyc,*.class,a.out
set wildmenu " command-line completion in an enhanced mode

set showcmd " display incomplete commands
set binary " similar to `vim -b`

set nohidden
set noshowmode
set noshowmatch
set nowrap
set nolist

set hlsearch
set incsearch

set signcolumn=yes
set ruler
set colorcolumn=80
set title
set nu

set history=500
set undolevels=500

set foldmethod=marker

set shell=/usr/bin/zsh
"""""""""""""""""""""
" Disabling vim's autocomment;
" see http://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost
" set mouse=a " enable the use of the mouse
" set listchars=tab:>.,eol:\$ " strings to use in 'list' mode
