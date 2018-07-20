""""""""""""""""""""""""""""""""""""""""
" LeaderF
"
" - https://www.zhihu.com/question/47691414/answer/373700711
"
" CTRL+P 在当前项目目录打开文件搜索，
" CTRL+N 打开MRU搜索，搜索你最近打开的文件，这两项是我用的最频繁的功能。
" 接着ALT+P 打开函数搜索，ALT+N 打开Buffer 搜索：
"
"
"p==============================================================================
"USAGE                                           *leaderf-usage*
"
":LeaderfFile [directory] or |<leader>|f           *LeaderfFile*
"    Launch LeaderF to search files.
"
":LeaderfBuffer or |<leader>|b                     *LeaderfBuffer*
"    Launch LeaderF to search buffers.
"
":LeaderfBufferAll                               *LeaderfBufferAll*
"    Same as LeaderfBuffer, except that the unlisted buffers are shown.
"
":LeaderfMru                                     *LeaderfMru*
"    Launch LeaderF to search Mru.
"
":LeaderfMruCwd                                  *LeaderfMruCwd*
"    Launch LeaderF to search Mru in current working directory.
"
":LeaderfTag                                     *LeaderfTag*
"    Launch LeaderF to navigate tags.
"
":LeaderfBufTag                                  *LeaderfBufTag*
"    Launch LeaderF to navigate tags in current buffer.
"
":LeaderfBufTagAll                               *LeaderfBufTagAll*
"    Launch LeaderF to navigate tags in all listed buffers.
"
":LeaderfFunction                                *LeaderfFunction*
"    Launch LeaderF to navigate functions or methods in current buffer.
"
":LeaderfFunctionAll                             *LeaderfFunctionAll*
"    Launch LeaderF to navigate functions or methods in all listed buffers.
"
":LeaderfLine                                    *LeaderfLine*
"    Launch LeaderF to search a line in current buffer.
"
":LeaderfLineAll                                 *LeaderfLineAll*
"    Launch LeaderF to search a line in all listed buffers.
"
":LeaderfHistoryCmd                              *LeaderfHistoryCmd*
"    Launch LeaderF to execute the command in the history.
"
":LeaderfHistorySearch                           *LeaderfHistorySearch*
"    Launch LeaderF to execute the search command in the history.
"
":LeaderfSelf                                    *LeaderfSelf*
"    Launch LeaderF to execute the commands of itself.
"
":LeaderfHelp                                    *LeaderfHelp*
"    Launch LeaderF to navigate the help tags.
"
":LeaderfColorscheme                             *LeaderfColorscheme*
"    Launch LeaderF to switch between colorschemes.
"
"Once LeaderF is launched:                       *prompt* *leaderf-prompt*
"    <C-C>, <ESC> : quit from LeaderF.
"    <C-R> : switch between fuzzy search mode and regex mode.
"    <C-F> : switch between full path search mode and name only search mode.
"    <Tab> : switch to normal mode.
"    <C-V>, <S-Insert> : paste from clipboard.
"    <C-U> : clear the prompt.
"    <C-J>, <Down>, <C-K>, <Up> : navigate the result list.
"    <2-LeftMouse> or <CR> : open the file under cursor or selected(when
"                            multiple files are selected).
"    <C-X> : open in horizontal split window.
"    <C-]> : open in vertical split window.
"    <C-T> : open in new tabpage.
"    <F5>  : refresh the cache.
"    <C-LeftMouse> or <C-S> : select multiple files.
"    <S-LeftMouse> : select consecutive multiple files.
"    <C-A> : select all files.
"    <C-L> : clear all selections.
"    <BS>  : delete the preceding character in the prompt.
"    <Del> : delete the current character in the prompt.
"    <Home>: move the cursor to the begin of the prompt.
"    <End> : move the cursor to the end of the prompt.
"    <Left>: move the cursor one character to the left.
"    <Right> : move the cursor one character to the right.
"    <C-P> : preview the result.
"
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'

"noremap <c-n> :LeaderfMru<cr>
"noremap <leader> <c-p> :LeaderfFunction!<cr>
"noremap <leader> <c-n> :LeaderfBuffer<cr>
"noremap <leader> <c-m> :LeaderfTag<cr>

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
