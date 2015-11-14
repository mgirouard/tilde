set showmatch
set matchtime=1
set colorcolumn=80

" Initialization
" -------------------------------------------------------------------------
set nocompatible
let mapleader = ","
filetype plugin on
syntax on
set encoding=utf-8

" Pathogen (as a bundle)
" -------------------------------------------------------------------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
silent! call pathogen#infect()
Helptags

" Colors
" -------------------------------------------------------------------------
syntax enable
set t_Co=256
set background=dark
colorscheme solarized

" Netrw Configuration 
" (who needs NERDTree?)
" -------------------------------------------------------------------------
"  Turn off top banner
let g:netrw_banner = 0

" Windows, Split, Tabs
" --------------------

" Make it convenient to swap tabs
nmap <Leader>t :tabn<cr>
nmap <Leader>T :tabp<cr>

" ... ditto for buffers
nmap <Leader>b :bprevious<cr>
nmap <Leader>B :bnext<cr>

" Use Tab key to jump between splits
nmap <Tab> <C-w><C-w>
nmap <S-Tab> <C-w>W

" Map control + hjkl keys to open splits in the respective directions
nmap <C-j> :rightbelow sp \| E<cr>
nmap <C-k> :sp \| E<cr>
nmap <C-l> :rightbelow vsp \| E<cr>
nmap <C-h> :vsp \| E<cr>
nmap <C-c> :close<cr>

" Like the above bug with a `gf` flavor:
nmap <C-w><C-l> :rightb vertical wincmd f<CR>
nmap <C-w><C-h> :vertical wincmd f<CR>

" Git
" -------------------------------------------------------------------------
" via Fugitive: https://github.com/tpope/vim-fugitive/
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>ga :Git add %<CR>
nmap <Leader>gp :Git add -p<CR>
nmap <Leader>gc :Gcommit -v<CR>
nmap <Leader>go :Git checkout 

" Unite
" ------------------------------------------------------------------------- 
nmap <Leader>f :Unite -start-insert file<CR>
nmap <Leader>r :Unite -start-insert file_rec<CR>
imap <C-f> <Esc>:Unite file<CR>
nmap _ :Unite buffer<CR>

" Status Line
" ------------------------------------------------------------------------- 
" Using vim-airline: https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1
set laststatus=2
let g:airline_symbols = {}
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶ '
let g:airline_symbols.branch = '⎇  '
let g:airline_symbols.paste = 'Þ'
let g:airline#extensions#whitespace#enabled = 1

" Buffers, Tabs
" -------------------------------------------------------------------------
nmap <Leader>d :bd<CR>
nmap <C-Tab> :tabn<CR>

" Shortcuts
" -------------------------------------------------------------------------
nmap <Leader>1 :set foldlevel=1<cr>
nmap <Leader>2 :set foldlevel=2<cr>

nmap <F3> :Tagbar<cr>
imap <F3> :Tagbar<cr>

" Jump around within the current window
" nmap <C-Space> <C-D><S-M>
nmap <M-Space> <C-U><S-M>

" FIXME: I am going to quit this bad habit
" Exit insert mode without a manual <ESC> or <C-C>
" imap <Leader><Leader> <ESC>l

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
set listchars=tab:·\ 
set listchars+=extends:…
nmap <Leader>l :set list!<CR>

" Toggle line wrapping
nmap <Leader>w :set wrap!<CR>

" Toggle line numbers
nmap <Leader>n :set nu!<CR>

" .vimrc Helpers
nmap <Leader>er :tabnew ~/.vimrc<CR>
nmap <Leader>sr :source ~/.vimrc<CR>

" Snipmate
nmap <Leader>es :tabnew ~/.vim/bundle/vim-snippets<CR>

" Trim off brackets:
" x = immediately under cursor
" X = nearest the cursor
nmap <Leader>x %x``x
nmap <Leader>X %%x``x

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
set foldmethod=indent
set foldlevel=99
let php_folding = 1

" Specific filetypes
" -------------------------------------------------------------------------

autocmd BufNewFile,BufRead,BufEnter *.sass set filetype=sass

autocmd BufNewFile,BufRead *.spark set filetype=xml
autocmd BufNewFile,BufRead parameters.yml.dist set filetype=yaml
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.html,*.phtml set filetype=php ai
autocmd BufNewFile,BufRead *.js set foldlevel=1
autocmd BufNewFile,BufRead *.txt,*.markdown,*.md,*.mdown,*.mkd,*.mkdn,README* set filetype=markdown
autocmd Filetype gitcommit set spell

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
