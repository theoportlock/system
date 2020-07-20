source $VIMRUNTIME/defaults.vim

nnoremap <SPACE> <Nop>
let mapleader = " "

" indenting
set autoindent
set smartindent

" For search cases
set ignorecase
set infercase
set incsearch

" Colouring
syntax on

" Set encoding
set encoding=utf-8

" Remove stupid sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Sudo saves the file
command! W w !sudo tee % > /dev/null

" For wildmenu
set wildmenu
set wildmode=full
set wildcharm=<Tab>
nnoremap <leader><Tab> :buffer<Space><Tab>

" For the numbering
set number
set relativenumber!

" For hidden buffer exiting
set hidden

" For global defaults
set gdefault

" File explorer
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
nnoremap <leader>a <esc>:Lexplore<enter>

" Run current script
nnoremap <leader>; <esc>:let @" = expand("%")<CR> <bar> :vert rightbelow term<CR>./<C-W>"0<CR>
nnoremap <F5> <esc>:w<enter>:!%:p<enter>

" Normal mode for terminal
tnoremap <F1> <C-W>N

" For indenting wrapped text properly
set breakindent
set linebreak

" make jk do esc
inoremap jk <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>
inoremap JK <esc>
vnoremap jk <Esc>
vnoremap jK <Esc>
vnoremap Jk <Esc>
vnoremap JK <Esc>

" leader commands
nnoremap <Leader>lc :! ~/system/scripts/compile %
" others
vnoremap <silent><Leader>y "yy <Bar> :call system('xclip -sel clip', @y)<CR> :call system('xclip', @y)<CR>

" set backups, swp, tmp
set backupdir=~/.vim/backup/,/tmp//
set directory=~/.vim/swap/,/tmp//
set undodir=~/.vim/undo/,/tmp//
set undofile

" Display name of file
set statusline +=%{resolve(expand('%:p'))}\ %*

" pyhelp
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cWORD>")<CR>

" toggle spellcheck
map <leader>ss :setlocal spell!<cr>

" omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" cycle through buffers
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

" mergetool for 1,2,3 for local base and remote
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

" omnicomplete remove popup
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
