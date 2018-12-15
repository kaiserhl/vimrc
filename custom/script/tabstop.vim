""" tabs to spaces
augroup common
  autocmd!
  autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.mdref set filetype=markdown_reference
  "
  autocmd BufRead,BufNewFile cpp,c set syntax=cpp11
  autocmd BufNewFile,BufRead,BufEnter *.cc,*.h set omnifunc=omni#cpp#complete#Main
  autocmd BufNewFile,BufRead,BufEnter *.html,*.css set omnifunc=htmlcomplete#CompleteTags
  "
  autocmd FileType c set ai sw=4 ts=4 fo=croql
  autocmd FileType asm set ai sw=4 ts=4 fo=croql
  "
  autocmd FileType cpp set omnifunc=cppcomplete#CompleteCPP
  autocmd FileType cpp set ai sw=2 ts=2 et fo=croql
  autocmd FileType python set ai sw=4 ts=4 et fo=croql
  autocmd FileType go set ai sw=4 ts=4 fo=croql
  autocmd FileType sh set ai sw=2 ts=2 et fo=croql
  autocmd FileType zsh set ai sw=2 ts=2 et fo=croql
  autocmd FileType cmake set ai sw=2 ts=2 et fo=croql
  autocmd FileType make set ai sw=4 ts=4 fo=croql
  "
  autocmd FileType html set ai sw=2 ts=2 et fo=croql
  autocmd FileType css set ai sw=2 ts=2 et fo=croql
  autocmd FileType javascript set ai sw=2 ts=2 et fo=croql
  "
  autocmd FileType vim set ai sw=2 ts=2 et fo=croql
  autocmd FileType vim,tex let b:autoformat_autoindent=0
  autocmd FileType plaintex set ai sw=4 ts=4 et fo=croql
  "
  autocmd FileType markdown set ai sw=2 ts=2 et fo=croql
  autocmd FileType markdown_reference set ai sw=2 ts=2 et fo=croql
  autocmd FileType dot set ai sw=2 ts=2 et fo=croql
  autocmd FileType yaml set ai sw=2 ts=2 et fo=croql
  autocmd FileType xml set ai sw=2 ts=2 et fo=croql
  autocmd FileType json set ai sw=2 ts=2 et fo=croql
  autocmd FileType proto set ai sw=2 ts=2 et fo=croql
  autocmd FileType sql set ai sw=2 ts=2 et fo=croql
  autocmd FileType nginx set ai sw=2 ts=2 et fo=croql
  "
  autocmd FileType awk set ai sw=4 ts=4 et fo=croql
  autocmd FileType lua set ai sw=4 ts=4 et fo=croql
  "
  autocmd FileType dockerfile set ai sw=2 ts=2 et fo=croql
  autocmd FileType *.conf set ai sw=2 ts=2 et fo=croql
  "
  autocmd FileType java set ai sw=2 ts=2 et fo=croql
  autocmd BufEnter *.gradle set ai sw=4 ts=4 et fo=croql
augroup END
