set nocompatible
filetype on
filetype off

source ~/.vim/functions/util.vim

if ! exists('g:vimified_packages')
    let g:vimified_packages = ['general', ]
endif

let s:bundle_path=$HOME."/.vim/bundle/"
execute "set rtp+=".s:bundle_path."vundle/"
call vundle#rc()
Bundle 'gmarik/vundle'

if count(g:vimified_packages, 'general')
    "Bundle 'edkolev/tmuxline.vim'
    "Bundle 'vim-scripts/buftabs'
    "Bundle 'SirVer/ultisnips'
    Bundle 'vim-scripts/OmniCppComplete'
    Bundle 'msanders/snipmate.vim'
    Bundle 'bling/vim-airline'
    Bundle 'bling/vim-bufferline'
    Bundle 'edsono/vim-matchit'
    Bundle 'scrooloose/nerdtree'
    Bundle 'mbriggs/mark.vim'
    Bundle 'ervandew/supertab'
    Bundle 'majutsushi/tagbar'
    Bundle 'mrtazz/DoxygenToolkit.vim'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'tpope/vim-afterimage'
    Bundle 'kevinw/pyflakes-vim'
    Bundle 'taxilian/a.vim'
endif

"===============================================================================
" GENERAL SETTINGS
"===============================================================================
syntax on            
"colorscheme desert 

filetype plugin on
filetype indent on

set encoding=utf-8              " encoding using utf-8
set noautoindent                 " copy indent from current line
set nosmartindent               " smart autoindenting when starting a new line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set browsedir=current           " which directory to use for the file browser

" disabling vim's autocomment; 
" see http://stackoverflow.com/questions/6076592/vim-set-formatoptions-being-lost
set formatoptions-=c
set formatoptions-=r 
set formatoptions-=o

set complete=.,w,b,u,t,k        " scan the files used for autocomplete, no 'i'

set history=700                 " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching

set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set mouse=a                     " enable the use of the mouse
set popt=left:8pc,right:3pc     " print options
set visualbell                  " visual bell instead of beeping
"set noerrorbells visualbell t_vb=

set nowrap                      " do not wrap lines
set ruler                       " show the cursor position all the time
set nu				" display line numbers
set showcmd                     " display incomplete commands
set nolist

set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set colorcolumn=80
set noswapfile

set laststatus=2
"set statusline=[%n]\ %<%f\ %([%1*%M%*%R%Y]%)\ \ \ \ %=%-19(\LINE\ [%l/%L]\ COL\ [%02c%03V]%)\ %P
"set statusline=%{buftabs#statusline()}

nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

hi BadWhiteSpace ctermbg=red
autocmd BufEnter *.h,*.cc,*.py match BadWhiteSpace /\s\+$/

augroup common 
  autocmd!
  autocmd BufReadPost *
  	\ if line("'\"") > 0 && line("'\"") <= line("$") |
  	\   exe "normal! g`\"" |
  	\ endif
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile cpp,c set syntax=cpp11
  autocmd BufNewFile,BufRead,BufEnter *.cc,*.h set omnifunc=omni#cpp#complete#Main
  autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP
  autocmd FileType markdown set expandtab
  autocmd FileType cpp,c set ai sw=2 ts=2 et fo=croql
  autocmd FileType cmake set ai sw=2 ts=2 et fo=croql
  autocmd FileType python set ai sw=4 ts=4 et fo=croql
  autocmd BufEnter *.proto set ai sw=4 ts=4 et fo=croql
  autocmd BufEnter *.tex set ai sw=4 ts=4 et fo=croql
  autocmd BufEnter *.sh set ai sw=4 ts=4 et fo=croql
augroup END

" tagbar 
 noremap <silent> <F11>  :TagbarToggle<CR>
inoremap <silent> <F11>  :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 30
let g:tagbar_autofocus = 0
let g:tagbar_sort = 1
let g:tagbar_compact = 1

" MiniBufExplor
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModeSelTarget = 1
let g:miniBufExplForceSyntaxEnable= 1

" NerdTreeToggle 
 noremap <silent> <F12>       :NERDTreeToggle<CR>
inoremap <silent> <F12>       :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowFiles = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1

" gundoToggle 
 noremap   <silent> <F10>       :GundoToggle<CR>
inoremap   <silent> <F10>       :GundoToggle<CR>

" supertab 
let g:SuperTabDefaultCompletionType = "context"

" ctags
"set tags=./tags,tags
augroup ctags 
  autocmd!
  autocmd BufWritePost *.c,*.cc,*.cpp,*.h silent! !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
augroup END

" OmniCPP complete
let g:OmniCpp_GlobalScopeSearch = 0
let g:OmniCpp_NamespaceSearch = 1		
let g:OmniCpp_DisplayMode = 1			" always show all members 
let g:OmniCpp_ShowScopeInAbbr = 1
let g:OmniCpp_ShowPrototypeInAbbr = 1		" show function prototype in popup window
let g:OmniCpp_ShowAccess = 1			" show accessbility 
let g:OmniCpp_MayCompleteDot = 1		" autocomplete with .
let g:OmniCpp_MayCompleteArrow = 1		" autocomplete with ->
let g:OmniCpp_MayCompleteScope = 1		" autocomplete with ::
let g:OmniCpp_SelectFirstItem = 2		" select first item (but don't insert)
let g:OmniCpp_LocalSearchDecl = 1		" user local search function
set completeopt=menuone,longest,menu

" DoxygenToolkit
let g:DoxygenToolkit_commentType = "C++" 
let g:DoxygenToolkit_compactDoc = "yes" " compact doxygen

" Pyflakes
let g:pyflakes_use_quickfix = 0

" buftabs
"let g:buftabs_only_basename=1
"let g:buftabs_in_statusline=2

" airline
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
