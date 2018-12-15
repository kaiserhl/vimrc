""""""""""""""""""""""""""""""""""""""""
" mark.vim
"
" ```
" https://vim.sourceforge.io/scripts/script.php?script_id=2666
" \m
" \n
" \*
" \#
" \r
" ```
"
"
"==============================================================================
"USAGE								  *mark-usage*
"
"HIGHLIGHTING						   *mark-highlighting*
"						     *<Leader>m* *v_<Leader>m*
"<Leader>m		Mark the word under the cursor, similar to the |star|
"			command. The next free highlight group is used. 
"			If already on a mark: Clear the mark, like
"			|<Leader>n|. 
"{Visual}<Leader>m	Mark or unmark the visual selection. 
"						     *<Leader>r* *v_<Leader>r*
"<Leader>r		Manually input a regular expression to mark. 
"{Visual}<Leader>r	Ditto, based on the visual selection. 
"
"			In accordance with the built-in |star| command,
"			all these mappings use 'ignorecase', but not
"			'smartcase'. 
"								   *<Leader>n*
"<Leader>n		Clear the mark under the cursor.
"			If not on a mark: Disable all marks, similar to
"			|:nohlsearch|. 
"
"			Note: Marks that span multiple lines are not detected,
"			so the use of <Leader>n on such a mark will
"			unintentionally remove all marks! Use
"			{Visual}<Leader>r or :Mark {pattern} to clear
"			multi-line marks. 
"								       *:Mark*
":Mark {pattern}		Mark or unmark {pattern}. 
"			For implementation reasons, {pattern} cannot use the
"			'smartcase' setting, only 'ignorecase'. 
":Mark			Disable all marks, similar to |:nohlsearch|. Marks
"			will automatically re-enable when a mark is added or
"			removed, or a search for marks is performed. 
"								  *:MarkClear*
":MarkClear		Clear all marks. In contrast to disabling marks, the
"			actual mark information is cleared, the next mark will
"			use the first highlight group. This cannot be undone. 
"
"
"SEARCHING						      *mark-searching*
"			    *<Leader>star* *<Leader>#* *<Leader>/* *<Leader>?*
"
"[count]*         [count]#
"[count]<Leader>* [count]<Leader>#
"[count]<Leader>/ [count]<Leader>?
"			Use these six keys to jump to the [count]'th next /
"			previous occurrence of a mark. 
"			You could also use Vim's / and ? to search, since the
"			mark patterns are (optionally, see configuration)
"			added to the search history, too. 
"
"            Cursor over mark                    Cursor not over mark
" ---------------------------------------------------------------------------
"  <Leader>* Jump to the next occurrence of      Jump to the next occurrence of
"            current mark, and remember it       "last mark". 
"            as "last mark". 
"
"  <Leader>/ Jump to the next occurrence of      Same as left. 
"            ANY mark. 
"
"   *        If <Leader>* is the most recently   Do Vim's original * command. 
"            used, do a <Leader>*; otherwise
"            (<Leader>/ is the most recently
"            used), do a <Leader>/. 
"
"			Note: When the cursor is on a mark, the backwards
"			search does not jump to the beginning of the current
"			mark (like the built-in search), but to the previous
"			mark. The entire mark text is treated as one entity. 
"
"			You can use Vim's |jumplist| to go back to previous
"			mark matches and the position before a mark search. 
"
"
