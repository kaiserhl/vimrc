" https://github.com/justinmk/vim-sneak
"
" *sneak.txt*  motion improved
" 
" Sneak - the missing motion for Vim
" 
" ==============================================================================
" OVERVIEW                                                               *sneak*
" 
" Sneak provides a way to move quickly and precisely to locations that would be
" awkward to reach with built-in Vim motions.
" 
" To use Sneak, type "s" followed by exactly two characters:
" 
" s{char}{char}
" 
" Thus you can often reach a target with 3 keystrokes. Sneak always moves
" immediately to the first {char}{char} match. Additional matches are
" highlighted, you can reach them by pressing ; (just like |f| and |t|).
" 
" Above all, the goal is to get out of your way. See |sneak-usage| for
" a quick-start, and |sneak-features| for full description.
" 
" Sneak works with Vim 7.2+ (|sneak-label-mode| requires Vim 7.3+).

let g:sneak#label = 1
