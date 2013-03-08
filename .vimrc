" Mike G's Super Amazing .vimrc
" ========================================================================= 
" More fun to be had at http://www.github.com/mgirouard/Dots

" Initialization
" ------------------------------------------------------------------------- 
set nocompatible
let mapleader = ","
filetype plugin on
syntax on

" Colors
" ------------------------------------------------------------------------- 
set t_Co=256

try
    colorscheme vividchalk
catch
    colorscheme desert
endtry

" Pathogen (as a bundle)
" ------------------------------------------------------------------------- 
runtime bundle/vim-pathogen/autoload/pathogen.vim
silent! call pathogen#infect()
Helptags

" Git
" ------------------------------------------------------------------------- 
" via Fugitive: https://github.com/tpope/vim-fugitive/
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>ga :Git add %<CR>
nmap <Leader>gp :Git add -p<CR>
nmap <Leader>gc :Git commit -v<CR>
nmap <Leader>go :Git checkout 

" Status Line
" ------------------------------------------------------------------------- 
" Inspired by spf13: https://github.com/spf13/spf13-vim/blob/master/.vimrc
set laststatus=2
set statusline=%n:
set statusline+=%<%t\ 
set statusline+=%w%h%m%r 
set statusline+=%{fugitive#statusline()} 
set statusline+=\ [%{&ff}/%Y] 
set statusline+=%=%-14.(%o,%l,%c%V%)\ %p%% 

" Buffers
" ------------------------------------------------------------------------- 
nmap <Leader>d :bd<CR>              " 녕히가세요
nmap <Leader>b :ls<CR>              " 여보세요

" Tabs
" ------------------------------------------------------------------------- 
nmap <C-Tab> :tabn<CR>

" Shortcuts
" ------------------------------------------------------------------------- 

" Exit insert mode without a manual <ESC> or <C-C>
imap <Leader><Leader> <ESC>l

" Quickly 'maximize' a split
nmap <Leader>mw <C-W>\|
nmap <Leader>mh <C-W>_
nmap <Leader>me <C-W>=
nmap <Leader>mm <Leader>mw<Leader>mh

" Quickly 'maximize' the entire UI
nmap <Leader>Mw :set columns=999<CR>
nmap <Leader>Mh :set lines=999<CR>
nmap <Leader>MM <Leader>Mw<Leader>Mh

" Jump to Current working directory
nmap <Leader>. :e .<CR>

" Jump to Current working directory
nmap - :Explore<CR>

" Toggle hidden chars
nmap <Leader>l :set list!<CR>

" Toggle line wrapping
nmap <Leader>w :set wrap!<CR>

" Toggle line numbers
nmap <Leader>n :set nu!<CR>

" .vimrc Helpers
nmap <Leader>er :tabnew ~/.vimrc<CR>
nmap <Leader>sr :source ~/.vimrc<CR>

" Indentation
" ------------------------------------------------------------------------- 

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set cindent

" Editor Behavior
" ------------------------------------------------------------------------- 

set nowrap
set nu
set showmode
set ruler
set cursorline

" Searching
set hlsearch
set incsearch
set ignorecase
nmap <Leader>/ :silent!/thisisacheapwayofclearingthesearch<CR>

" Insure Clean Pasting w/autoindented code
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2> 

" Backup files are for the weak
set nobackup
set nowritebackup

" Syntax
" ------------------------------------------------------------------------- 

syntax on
filetype plugin indent on
set showmatch
setlocal foldmethod=syntax
set foldlevel=1
let php_folding = 1

" Specific filetypes
" ------------------------------------------------------------------------- 

autocmd BufNewFile,BufRead,BufEnter *.sass set filetype=sass

autocmd BufNewFile,BufRead *.spark set filetype=xml
autocmd BufNewFile,BufRead *.html,*.phtml set filetype=php ai
autocmd BufNewFile,BufRead *.js set foldlevel=0
autocmd BufNewFile,BufRead *.txt,*.markdown,*.mdown,*.mkd,*.mkdn,README* setf markdown | set linebreak wrap

autocmd FileType java setlocal noexpandtab softtabstop=0
autocmd FileType xml setlocal noexpandtab softtabstop=0

if expand('%:t') =~?'bash-fc-\d\+'
  setfiletype sh
endif


" GUI only stuff
" ------------------------------------------------------------------------- 

if has('gui_running')
    set guioptions=gt
    set colorcolumn=80
endif

if has('mac')
    set guifont=Monaco:h11
elseif has('unix')
    cmap w!! %!sudo tee > /dev/null %
elseif has('win32')
    set guifont=Consolas:h10
    set backspace=2
endif

" Workarounds and bug fixes
" ------------------------------------------------------------------------- 

" Set a window's attributes back to normal after NetRw borks them
"
" I shouldn't have to do this, but for some reason navigating up 
" directories in Netrw will cause a window to have `nomodifiable` and 
" `readonly` set. It also drops line numbers.
"
" I'm guessing it's inheriting those properties from the Netrw window.
nmap <Leader>! :set nu modifiable noreadonly<CR>

" Close all folds except for the current one
"
" This is useful when folds toggle open when adjusting strings or brackets
nmap <Leader>O zrzmzo
