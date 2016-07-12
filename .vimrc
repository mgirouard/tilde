" Initialization
" -------------------------------------------------------------------------
set nocompatible
let mapleader = ","
filetype plugin on
syntax on
set encoding=utf-8

" Pathogen
" -------------------------------------------------------------------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
silent! call pathogen#infect()
Helptags

" Maps
" -------------------------------------------------------------------------
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <F3> :Tagbar<cr>
nnoremap <F4> :call PhpFmtFixFile()<CR>
nnoremap <F5> :SyntasticToggleMode<CR>

nmap <Leader>/ :silent!/thisisacheapwayofclearingthesearch<CR>

" Tab Switching
nmap <Leader>t :tabn<cr>
nmap <Leader>T :tabp<cr>

" Buffer Switching
nmap <Leader>b :bprevious<cr>
nmap <Leader>B :bnext<cr>

" Split Switching
nmap <Tab> <C-w><C-w>
nmap <S-Tab> <C-w>W

" Create splits quickly in all directions
nmap <C-j> :rightbelow sp \| Explore<cr>
nmap <C-k> :sp \| Explore<cr>
nmap <C-l> :rightbelow vsp \| Explore<cr>
nmap <C-h> :vsp \| Explore<cr>

nmap <C-c> :close<cr>
nmap <Leader>d :bd<CR>

" Open files in splits
nmap <C-w><C-l> :rightb vertical wincmd f<CR>
nmap <C-w><C-h> :vertical wincmd f<CR>

" Toggle folding
nmap <Leader>1 :set foldlevel=1<cr>
nmap <Leader>2 :set foldlevel=2<cr>

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

" Edit or reload .vimrc
nmap <Leader>er :tabnew ~/.vimrc<CR>
nmap <Leader>sr :source ~/.vimrc<CR>

" Snipmate
nmap <Leader>es :tabnew ~/.vim/bundle/vim-snippets<CR>

" Trim off brackets:
" x = immediately under cursor
" X = nearest the cursor
nmap <Leader>x %x``x
nmap <Leader>X %%x``x

" Editor Behavior
" -------------------------------------------------------------------------

filetype plugin indent on
set autoindent
set background=dark
set cindent
set colorcolumn=80
set cursorline
set expandtab
set foldlevel=99
set foldmethod=indent
set hlsearch
set ignorecase
set incsearch
set matchtime=1
set nobackup
set nowrap
set nowritebackup
set number
set pastetoggle=<F2>
set ruler
set shiftwidth=4
set showmatch
set showmode
set softtabstop=4
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set t_Co=256
set tabstop=4
set tags=./project.tags;project.tags
syntax on

" Airline
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

" Colors
" -------------------------------------------------------------------------
colorscheme solarized

" Git
" -------------------------------------------------------------------------
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>ga :Git add %<CR>
nmap <Leader>gp :Git add -p<CR>
nmap <Leader>gp :Git checkout -p<CR>
nmap <Leader>gc :Gcommit -v<CR>
nmap <Leader>go :Git checkout
nmap <Leader>gn :GitGutterNextHunk<CR>
nmap <Leader>gN :GitGutterPrevHunk<CR>

" Netrw Configuration 
" -------------------------------------------------------------------------
"  Turn off top banner
let g:netrw_banner = 0

" PHP
" -------------------------------------------------------------------------
let php_folding = 1

" phpfmt Configuration
" -------------------------------------------------------------------------
let g:phpfmt_update_on_open = 0
let g:phpfmt_enable_default_mapping = 0
let g:phpfmt_on_save = 0
let g:phpfmt_config = expand('~') . '/.php.tools.ini'

" Syntastic
" -------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_php_phpcs_args = "--standard=PSR2"

" Tagbar
" ------------------------------------------------------------------------- 
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

" Unite
" ------------------------------------------------------------------------- 
let g:unite_redraw_hold_candidates = 50000
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <nnoremapleader>r :<C-u>Unite -start-insert file_rec<CR>
nnoremap <leader>r :<C-u>Unite -start-insert file_rec/git<CR>
imap <C-f> <Esc>:Unite file<CR>
nmap _ :Unite buffer<CR>

" Specific filetypes
" -------------------------------------------------------------------------
autocmd BufNewFile,BufRead,BufEnter *.sass set filetype=sass
autocmd BufNewFile,BufRead *.spark set filetype=xml
autocmd BufNewFile,BufRead parameters.yml.dist set filetype=yaml
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.html,*.phtml set filetype=php ai
autocmd BufNewFile,BufRead *.js set foldlevel=1
autocmd BufNewFile,BufRead *.txt,*.markdown,*.md,*.mdown,*.mkd,*.mkdn,README* set filetype=markdown
autocmd BufNewFile,BufRead *.yml,*.yaml set foldmethod=indent
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

" Local Settings
" -------------------------------------------------------------------------
if filereadable (expand("~/.vimrc.local"))
    :source ~/.vimrc.local
endif
