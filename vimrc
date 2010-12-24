" Indentation
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set cindent

" Editor Behavior
set wrap!
set nu
set showmode

" Syntax Behavior
syntax on
filetype indent on
set showmatch

" Mouse Support
if has('mouse')
    set mouse=a
endif

" GUI only options
if has('gui_running')
    set guioptions=-t
endif

" Insure Clean Pasting w/autoindented code
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2> 

" Netrw Settings
let g:netrw_alto              = 1  " Horiz split under
let g:netrw_altv              = 2  " Vert split right
let g:netrw_browse_split      = 3  " Vert split on <cr>
let g:netrw_liststyle         = 3  " Tree View
let g:netrw_winsize           = 30 " 30 column width 
