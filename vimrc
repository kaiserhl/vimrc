set nocompatible
filetype off

if ! exists('g:vimified_packages')
  let g:vimified_packages = ['general', ]
endif

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
if count(g:vimified_packages, 'general')
  "Bundle 'edkolev/tmuxline.vim'
  "Bundle 'bling/vim-bufferline'
  Bundle 'lightmanhk/vim-colorschemes'
  Bundle 'Valloric/vim-operator-highlight'
  Bundle 'gagoar/StripWhiteSpaces'
  Bundle 'SirVer/ultisnips'
  Bundle 'lightmanhk/vim-snippets'
  Bundle 'vim-scripts/OmniCppComplete'
  Bundle 'bling/vim-airline'
  Bundle 'jeetsukumaran/vim-filebeagle'
  "Bundle 'vim-scripts/closetag.vim'
  "Bundle 'Shougo/vimfiler.vim'
  "Bundle 'Shougo/unite.vim'
  "Bundle 'nathanaelkane/vim-indent-guides'
  Bundle 'scrooloose/nerdtree'
  Bundle 'mbriggs/mark.vim'
  Bundle 'majutsushi/tagbar'
  Bundle 'mrtazz/DoxygenToolkit.vim'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'kevinw/pyflakes-vim'
  Bundle 'lightmanhk/a.vim'
  Bundle 'sukima/xmledit'
  Bundle 'tpope/vim-eunuch'
  Bundle 'kien/ctrlp.vim'
  Bundle 'Dinduks/vim-java-get-set'
  "Bundle 'd11wtq/ctrlp_bdelete.vim'
endif

"===============================================================================
" GENERAL SETTINGS
"===============================================================================
syntax on
set background=dark
colorscheme anotherdark

filetype on
filetype plugin on
filetype indent on

set encoding=utf-8              " encoding using utf-8
set noautoindent                " copy indent from current line
set smartindent                 " smart autoindenting when starting a new line
set nocindent
set indentexpr=
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
"set mouse=a                     " enable the use of the mouse
set popt=left:8pc,right:3pc     " print options
set visualbell                  " visual bell instead of beeping
"set noerrorbells visualbell t_vb=

set nowrap                      " do not wrap lines
set ruler                       " show the cursor position all the time
set nu                          " display line numbers
set showcmd                     " display incomplete commands
set nolist

set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set colorcolumn=80
set noswapfile

set laststatus=2

"" enable 256 colors in vim; don't use this unless you have to
"set t_Co=256

" match whole line
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" tabs to spaces
augroup common
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile cpp,c set syntax=cpp11
  autocmd BufNewFile,BufRead,BufEnter *.cc,*.h set omnifunc=omni#cpp#complete#Main
  autocmd BufNewFile,BufRead,BufEnter *.html,*.css set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP
  autocmd FileType cpp,c set ai sw=2 ts=2 et fo=croql
  autocmd FileType cmake set ai sw=2 ts=2 et fo=croql
  autocmd FileType python set ai sw=4 ts=4 et fo=croql
  autocmd FileType make set ai sw=4 ts=4 fo=croql
  autocmd FileType markdown set ai sw=2 ts=2 et fo=croql
  autocmd FileType yaml set ai sw=2 ts=2 et fo=croql
  autocmd FileType java set ai sw=2 ts=2 et fo=croql
  autocmd FileType vim set ai sw=2 ts=2 et fo=croql
  autocmd FileType xml set ai sw=2 ts=2 et fo=croql
  autocmd FileType html set ai sw=2 ts=2 et fo=croql
  autocmd FileType sh set ai sw=2 ts=2 et fo=croql
  autocmd FileType sql set ai sw=2 ts=2 et fo=croql
  autocmd FileType proto set ai sw=2 ts=2 et fo=croql
  autocmd FileType plaintex set ai sw=4 ts=4 et fo=croql
  autocmd FileType javascript set ai sw=2 ts=2 et fo=croql
  autocmd FileType html set ai sw=2 ts=2 et fo=croql
  autocmd FileType svn set ai sw=2 ts=2 et fo=croql
  autocmd BufEnter *.gradle set ai sw=4 ts=4 et fo=croql
augroup END

" tagbar
noremap <silent> <F11>  :TagbarToggle<CR>
inoremap <silent> <F11>  :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 30
let g:tagbar_autofocus = 0
let g:tagbar_sort = 1
let g:tagbar_compact = 1

" NerdTreeToggle
noremap <silent> <F12> :NERDTreeToggle<CR>
inoremap <silent> <F12> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowFiles = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMapJumpNextSibling = ""
let g:NERDTreeMapJumpPrevSibling = ""
let g:NERDTreeIgnore = ['\.pyc$[[file]]', '\.svn$[[dir]]', '\.class$[[file]]', '\.jar$[[file]]', '\.git$[[dir]]']

" gundoToggle
noremap  <silent> <F10> :GundoToggle<CR>
inoremap <silent> <F10> :GundoToggle<CR>

" ctags
set tags=./tags,tags
if has('win32') || has('win16')
elseif has('unix')
  augroup ctags_cxx
    autocmd!
    autocmd FileType cpp noremap <silent> <F2> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
  augroup END
elseif has('mac')
  augroup ctags_cxx
    autocmd!
    autocmd FileType cpp noremap <silent> <F2> :!/opt/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
  augroup END
endif

" TODO a.vim AlternateExtensions is broken; have to forked it to customize

" OmniCPP complete
let g:OmniCpp_GlobalScopeSearch = 0
let g:OmniCpp_NamespaceSearch = 1
let g:OmniCpp_DisplayMode = 1           " always show all members
let g:OmniCpp_ShowScopeInAbbr = 1
let g:OmniCpp_ShowPrototypeInAbbr = 1       " show function prototype in popup window
let g:OmniCpp_ShowAccess = 1            " show accessbility
let g:OmniCpp_MayCompleteDot = 1        " autocomplete with .
let g:OmniCpp_MayCompleteArrow = 1      " autocomplete with ->
let g:OmniCpp_MayCompleteScope = 1      " autocomplete with ::
let g:OmniCpp_SelectFirstItem = 2       " select first item (but don't insert)
let g:OmniCpp_LocalSearchDecl = 1       " user local search function
set completeopt=menuone,longest,menu

" DoxygenToolkit
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_compactDoc = "yes" " compact doxygen

" Pyflakes
let g:pyflakes_use_quickfix = 0

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s: '

" UltiSnips TODO
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=grey
let g:indent_guides_start_level = 1
let g:indent_guides_enable_on_vim_startup = 1

" ctrl-p
let g:ctrlp_map = '<c-l>'
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
let g:ctrlp_switch_buffer = 'ev'
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class|pyc)$',
  \ }
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("t")': ['<cr>',],
  \ }
let g:ctrlp_cmd = 'CtrlPCurWD'

" java-getset-vim
let b:javagetset_getterTemplate =
          \ "\n" .
          \ "%modifiers% %type% %funcname%() { \n " .
          \ "  return %varname%; \n" .
          \ "}"
let b:javagetset_setterTemplate =
          \ "\n" .
          \ "%modifiers% void %funcname%(%type% %varname%) {\n" .
          \ "  this.%varname% = %varname%; \n" .
          \ "}"
let b:javagetset_insertPosition  = 2

" create intermediate directories on the fly
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
