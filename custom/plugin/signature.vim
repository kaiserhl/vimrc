". Mappings                                                *SignatureMappings*
"
"Out of the box, the followings mappings are defined by default
"
"  mx           Toggle mark 'x' and display it in the leftmost column
"  dmx          Remove mark 'x' where x is a-zA-Z
"
"  m,           Place the next available mark
"  m.           If no mark on line, place the next available mark. Otherwise,
"               remove (first) existing mark.
"  m-           Delete all marks from the current line
"  m<Space>     Delete all marks from the current buffer
"  ]`           Jump to next mark
"  [`           Jump to prev mark
"  ]'           Jump to start of next line containing a mark
"  ['           Jump to start of prev line containing a mark
"  `]           Jump by alphabetical order to next mark
"  `[           Jump by alphabetical order to prev mark
"  ']           Jump by alphabetical order to start of next line having a mark
"  '[           Jump by alphabetical order to start of prev line having a mark
"  m/           Open location list and display marks from current buffer
"
"  m[0-9]       Toggle the corresponding marker !@#$%^&*()
"  m<S-[0-9]>   Remove all markers of the same type
"  ]-           Jump to next line having a marker of the same type
"  [-           Jump to prev line having a marker of the same type
"  ]=           Jump to next line having a marker of any type
"  [=           Jump to prev line having a marker of any type
"  m?           Open location list and display markers from current buffer
"  m<BS>        Remove all markers
"
"This will allow the use of default behavior of m to set marks and, if
"the line already contains the mark, it'll be unset. The default behavior
"of ]', [', ]` and [` is supported and enhanced by wrapping around when
"beginning or end of file is reached. ]-, [-, ]= and [= also accept a count.
"
"To directly jump to a given marker, the following maps can be used
">
"  nnoremap [1 :call signature#marker#Goto('prev', 1, v:count)
"  nnoremap ]1 :call signature#marker#Goto('next', 1, v:count)
"  nnoremap [2 :call signature#marker#Goto('prev', 2, v:count)
"  nnoremap ]2 :call signature#marker#Goto('next', 2, v:count)
"<
"etc. These are not defined by default
"
"
