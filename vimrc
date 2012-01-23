" ========================================================================= 
" # Shortcuts
" ========================================================================= 

let mapleader = ","

" Quickly 'maximize' a split
nmap <Leader>mw <C-W>\|
nmap <Leader>mh <C-W>_
nmap <Leader>me <C-W>=
nmap <Leader>mm <Leader>mw<Leader>mh

" Quickly 'maximize' the entire UI
nmap <Leader>Mw :set columns=999<CR>
nmap <Leader>Mh :set lines=999<CR>
nmap <Leader>MM <Leader>Mw<Leader>Mh

" Split up/down/left/right
nmap <Leader>sk :sp \| enew<CR>
nmap <Leader>sj :rightbelow sp \| enew<CR>
nmap <Leader>sh :vsp \| enew<CR>
nmap <Leader>sl :rightbelow vsp \| enew<CR>

" Split navigation

nmap <Leader>l <C-w>l
nmap <Leader>h <C-w>h
nmap <Leader>k <C-w>k
nmap <Leader>j <C-w>j

" Tab navigation
nmap <Leader>tn :tabnext<CR>
nmap <Leader>tp :tabprev<CR>

" Buffer navigation
nmap <Leader>bn :bnext<CR>
nmap <Leader>bp :bprev<CR>

" Pasting (Ctrl+v is baked into my muscle memory)
imap <C-v> <C-o>"+gP
vmap <C-v> "+gP

" Copying (Ctrl+c is too...)
vmap <C-c> "+y

" ========================================================================= 
" # Indentation
" ========================================================================= 

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set cindent

" ========================================================================= 
" # Editor Behavior
" ========================================================================= 

set nowrap
set nu
set showmode
set ruler
set backspace=2

" Insure Clean Pasting w/autoindented code
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2> 

" Backup files are for the weak
set nobackup
set nowritebackup 

" ========================================================================= 
" # Syntax
" ========================================================================= 

syntax on
filetype indent on
set showmatch
setlocal foldmethod=syntax
let php_folding = 1

" ========================================================================= 
" # Specific filetypes
" ========================================================================= 

autocmd BufNewFile,BufRead *.spark set filetype=xml
autocmd BufNewFile,BufRead *.phtml set filetype=php

" ========================================================================= 
" # Colors
" ========================================================================= 

colorscheme slate

" ========================================================================= 
" # Mouse behavior
" ========================================================================= 

if has('mouse')
    set mouse=a
endif

" ========================================================================= 
" # GUI only stuff
" ========================================================================= 

if has('gui_running')
    set guioptions=gt
endif

if has('mac')
    set guifont=Monaco:h12
elseif has('unix')
    cmap w!! %!sudo tee > /dev/null %
elseif has('win32')
    set guifont=Consolas:h10
endif

" ========================================================================= 
" # Netrw Stuff
" ========================================================================= 

let g:netrw_alto              = 1   " Horiz split under
let g:netrw_altv              = 2   " Vert split right
let g:netrw_browse_split      = 2   " Vert split on <cr>
let g:netrw_liststyle         = 3   " Tree View
let g:netrw_winsize           = 30  " 30 column width 
