set nocompatible
set path+=**
set wildmenu
set number
set background=dark

syntax on
filetype plugin on
colorscheme PaperColor

command! MakeTags !ctags -R .

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
