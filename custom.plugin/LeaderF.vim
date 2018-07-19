""""""""""""""""""""""""""""""""""""""""
" LeaderF
"
" - https://www.zhihu.com/question/47691414/answer/373700711
"
" CTRL+P 在当前项目目录打开文件搜索，
" CTRL+N 打开MRU搜索，搜索你最近打开的文件，这两项是我用的最频繁的功能。
" 接着ALT+P 打开函数搜索，ALT+N 打开Buffer 搜索：
"
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'

noremap <c-n> :LeaderfMru<cr>
noremap <leader> <c-p> :LeaderfFunction!<cr>
noremap <leader> <c-n> :LeaderfBuffer<cr>
noremap <leader> <c-m> :LeaderfTag<cr>

let g:Lf_MruMaxFiles = 2048
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
