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

vmap <C-c> "+y
nmap <C-v> "+p

autocmd FileType java nmap ,psvm ipublic static void main(String[] args) {<CR>}<ESC>O  
autocmd FileType java nmap ,sopl aSystem.out.println("");<ESC>2hi
autocmd FileType java nmap ,fori ifor (int i = 0, i < , i++) {<CR>}<ESC>kf<la
