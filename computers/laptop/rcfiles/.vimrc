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

" Leader commands
" autocmd FileType python nnoremap <leader>t <esc>:let @" = expand("%")<CR> <bar> :vert rightbelow term<CR>./<C-W>"0<CR>
" autocmd FileType python nnoremap <leader>tl <esc>:let @" = expand("%")<CR> <bar> :vert rightbelow term<CR>ipython <C-W>"0<CR><C-W><C-W>
" autocmd FileType python nnoremap <leader>i :vert rightbelow term<CR>ipython<CR><C-W><C-W>
" autocmd FileType python nnoremap <leader>i <esc>let s:path = expand('<sfile>:p:h')<CR> <bar> :vert rightbelow term<CR>cd <C-W>"0<CR>ipython<CR><C-W><C-W>
" autocmd FileType python vnoremap <leader>h :let @" = expand("%")<CR> <bar> :<C-U>!pydoc3 % <CR>
" autocmd FileType python nnoremap <leader>H :<C-u>execute "!pydoc3 " . expand("<cWORD>")<CR>
" autocmd FileType python nnoremap <leader>f :w<enter>:let @" = expand("%")<CR> <bar> :!flake8 %
" autocmd FileType python set textwidth=80
" autocmd FileType python set formatoptions+=tautocmd FileType python
autocmd FileType python set shell=ipython
autocmd FileType r set shell=R
autocmd FileType bash set shell=bash
nnoremap <leader>t :vert rightbelow term<CR><C-W><C-W>
nnoremap <leader>r yy<C-W><C-W><C-W>"0<C-W><C-W>j
vnoremap <leader>r y<C-W><C-W><C-W>"0<C-W><C-W><esc>j
nnoremap <leader>a <esc>:Lexplore<enter>
nnoremap <leader>; :w<enter>:let @" = expand("%")<CR> <bar> :silent !urxvt -hold -e bash --rcfile <(echo '. ~/.bashrc; ./%') & <CR> 
nnoremap <leader>lc :w<enter>:silent !urxvt -hold -e bash --rcfile <(echo '. ~/.bashrc; ./compile.sh') & <CR>
nnoremap <F5> <esc>:w<enter>:!%:p<enter>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>ss :setlocal spell!<CR>
vnoremap <silent><Leader>y "yy <Bar> :call system('xclip -sel clip', @y)<CR> :call system('xclip', @y)<CR>

" Normal mode for terminal
tnoremap <F1> <C-W>N
autocmd QuitPre * call range(1, bufnr('$'))->filter('getbufvar(v:val, "&buftype") == "terminal"')->map('term_setkill(v:val, "hup")')

" For indenting wrapped text properly
set breakindent
set linebreak

" Make jk do esc
inoremap jk <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>
inoremap JK <esc>

" set backups, swp, tmp
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//,
set undofile

" Display name of file
set statusline +=%{resolve(expand('%:p'))}\ %*

" Remove folding from vimdiff
set nofoldenable

" Omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Vim mergetool 
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

" Default to not read-only in vimdiff
set noro

" omnicomplete remove popup
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" trailing whitespaces
" set listchars=trail:·
" set list

" Make Y yank till end of line
nnoremap Y y$

" Tag support
set tagrelative
set tags=./tags,tags;
