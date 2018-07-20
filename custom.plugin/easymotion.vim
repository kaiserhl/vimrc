" https://github.com/easymotion/vim-easymotion
"
"Usage                                                        *easymotion-usage*
"
"EasyMotion is triggered by one of the provided mappings (see
"|easymotion-default-mappings| for details).
"
"Example: >
"
"    <cursor>Lorem ipsum dolor sit amet.
"
"Type <Leader><Leader>w to trigger the word motion |w|. See
"|easymotion-leader-key| for details about the leader key. When the
"motion is triggered, the text is updated (no braces are actually added,
"the text is highlighted in red by default): >
"
"    <cursor>Lorem {a}psum {b}olor {c}it {d}met.
"
"Press "c" to jump to the beginning of the word "sit": >
"
"    Lorem ipsum dolor <cursor>sit amet.
"
"Similarly, if you're looking for an "o", you can use the |f| motion.
"Type <Leader><Leader>fo, and all "o" characters are highlighted: >
"
"    <cursor>L{a}rem ipsum d{b}l{c}r sit amet.
"
"Press "b" to jump to the second "o": >
"
"    Lorem ipsum d<cursor>olor sit amet.
"
"And that's it!
"
"-
"------------------------------------------------------------------------------
"Default mappings                                  *easymotion-default-mappings*
"
"The default configuration defines the following mappings in normal,
"visual and operator-pending mode if |g:EasyMotion_do_mapping| is on:
"
"Note: The default leader has been changed to <Leader><Leader> to avoid
"      conflicts with other plugins you may have installed
"
"    Default Mapping      | Details
"    ---------------------|----------------------------------------------
"    <Leader>f{char}      | Find {char} to the right. See |f|.
"    <Leader>F{char}      | Find {char} to the left. See |F|.
"    <Leader>t{char}      | Till before the {char} to the right. See |t|.
"    <Leader>T{char}      | Till after the {char} to the left. See |T|.
"    <Leader>w            | Beginning of word forward. See |w|.
"    <Leader>W            | Beginning of WORD forward. See |W|.
"    <Leader>b            | Beginning of word backward. See |b|.
"    <Leader>B            | Beginning of WORD backward. See |B|.
"    <Leader>e            | End of word forward. See |e|.
"    <Leader>E            | End of WORD forward. See |E|.
"    <Leader>ge           | End of word backward. See |ge|.
"    <Leader>gE           | End of WORD backward. See |gE|.
"    <Leader>j            | Line downward. See |j|.
"    <Leader>k            | Line upward. See |k|.
"    <Leader>n            | Jump to latest "/" or "?" forward. See |n|.
"    <Leader>N            | Jump to latest "/" or "?" backward. See |N|.
"    <Leader>s            | Find(Search) {char} forward and backward.
"                         | See |f| and |F|.
