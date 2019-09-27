" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim


" To install useful key bindings and fuzzy completion:
" $(brew --prefix)/opt/fzf/install


" fzf
"" Look for files under current directory
":FZF
"" Look for files under your home directory
":FZF ~
"" With options
":FZF --no-sort --reverse --inline-info /tmp
"" Bang version starts fzf in fullscreen mode
":FZF!
"
"CTRL-J / CTRL-K (or CTRL-N / CTRL-P) to move cursor up and down
"Enter key to select the item, CTRL-C / CTRL-G / ESC to exit
"On multi-select mode (-m), TAB and Shift-TAB to mark multiple items
"Emacs style key bindings
"Mouse: scroll, click, double-click; shift-click and shift-scroll on multi-select mode


" fzf.vim
"Command	List
"Files [PATH]	Files (similar to :FZF)
"GFiles [OPTS]	Git files (git ls-files)
"GFiles?	Git files (git status)
"Buffers	Open buffers
"Colors	Color schemes
"Ag [PATTERN]	ag search result (ALT-A to select all, ALT-D to deselect all)
"Rg [PATTERN]	rg search result (ALT-A to select all, ALT-D to deselect all)
"Lines [QUERY]	Lines in loaded buffers
"BLines [QUERY]	Lines in the current buffer
"Tags [QUERY]	Tags in the project (ctags -R)
"BTags [QUERY]	Tags in the current buffer
"Marks	Marks
"Windows	Windows
"Locate PATTERN	locate command output
"History	v:oldfiles and open buffers
"History:	Command history
"History/	Search history
"Snippets	Snippets (UltiSnips)
"Commits	Git commits (requires fugitive.vim)
"BCommits	Git commits for the current buffer
"Commands	Commands
"Maps	Normal mode mappings
"Helptags	Help tags 1
"Filetypes	File types


" This is the default extra key bindings
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }

