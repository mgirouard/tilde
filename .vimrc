" ========================================================================= 
" # Initialization
" ========================================================================= 

set nocompatible
call pathogen#infect()
let mapleader = ","

" ========================================================================= 
" # Shortcuts
" ========================================================================= 

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

" Jump to Current working directory
nmap <Leader>. :Rexplore<CR>

" Toggle hidden chars
nmap <Leader>l :set list!<CR>

" Toggle line wrapping
nmap <Leader>w :set wrap!<CR>

" Toggle line numbers
nmap <Leader>n :set nu!<CR>

" .vimrc Helpers
nmap <Leader>er :tabnew ~/.vimrc<CR>
nmap <Leader>sr :source ~/.vimrc<CR>

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

" Searching
set hlsearch
set incsearch
set ignorecase

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
filetype plugin indent on
set showmatch
setlocal foldmethod=syntax
set foldlevel=1
let php_folding = 1
let javaScript_fold=1

" ========================================================================= 
" # Specific filetypes
" ========================================================================= 

autocmd BufNewFile,BufRead *.spark set filetype=xml
autocmd BufNewFile,BufRead *.phtml set filetype=php
autocmd BufNewFile,BufRead *.js set foldlevel=0
autocmd BufNewFile,BufRead *.markdown set linebreak wrap

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
    set guifont=Monaco:h11
    set transparency=20
elseif has('unix')
    cmap w!! %!sudo tee > /dev/null %
elseif has('win32')
    set guifont=Consolas:h10
    set backspace=2
endif
