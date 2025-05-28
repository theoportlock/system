" === Base Config ===
source $VIMRUNTIME/defaults.vim
set encoding=utf-8
set nocompatible
filetype plugin on
syntax on

" === Leader Key ===
nnoremap <SPACE> <Nop>
let mapleader = " "

" === Indentation ===
set autoindent
set smartindent
set breakindent
set linebreak

" === Search ===
set ignorecase
set infercase
set incsearch

" === UI ===
set number
set relativenumber
set statusline +=%{resolve(expand('%:p'))}\ %*
set nofoldenable
set equalalways
autocmd VimResized * wincmd =

" === Terminal Behavior ===
set hidden
set gdefault
tnoremap <F1> <C-W>N
autocmd QuitPre * call range(1, bufnr('$'))->filter('getbufvar(v:val, "&buftype") == "terminal"')->map('term_setkill(v:val, "hup")')

" === Silence Vim ===
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" === Completion ===
set omnifunc=syntaxcomplete#Complete
augroup complete_close
  autocmd!
  autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|pclose|endif
augroup END

" === Clipboard ===
if has('clipboard')
  set clipboard=unnamedplus
endif

" === File Explorer ===
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

" === Yank to System Clipboard ===
vnoremap <silent><Leader>y "yy :call system('xclip -sel clip', @y)<CR>

" === Leader Mappings ===
autocmd FileType python set shell=python
autocmd FileType r set shell=R
autocmd FileType bash set shell=bash

nnoremap <leader>t :vert rightbelow term<CR><C-W><C-W>
nnoremap <leader>a :Lexplore<CR>
nnoremap <leader>lc :w<CR>:silent !xterm -hold -e bcsh --rcfile <(echo '. ~/.bashrc; ./compile.sh') &<CR>
nnoremap <F5> :!xterm -hold -e ' . &filetype . ' %'<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>ss :setlocal spell!<CR>

" === Send to Terminal ===
function! SendToTerm() range
    if exists("*term_sendkeys")
        let l:content = getreg('"')
        let l:paste_start = "\e[200~"
        let l:paste_end = "\e[201~"
        let l:full_content = l:paste_start . l:content . l:paste_end . "\<CR>"
        execute "normal! \<C-W>w"
        call term_sendkeys('', l:full_content)
        execute "normal! \<C-W>w"
    else
        echoerr "term_sendkeys not available in this version of Vim"
    endif
endfunction
nnoremap <leader>r yy:call SendToTerm()<CR>j
vnoremap <leader>r y:call SendToTerm()<CR>gvVj

" === Backup, Swap, Undo (default hidden files in same dir) ===
set backup
set swapfile
set undofile

" === Merge Tool ===
if &diff
    nnoremap <leader>1 :diffget LOCAL<CR>
    nnoremap <leader>2 :diffget BASE<CR>
    nnoremap <leader>3 :diffget REMOTE<CR>
    set noro
endif

" === Tags ===
set tagrelative
set tags=./tags,tags;

" === Quality of Life ===
inoremap jk <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>
inoremap JK <Esc>
inoremap kj <Esc>
inoremap kJ <Esc>
inoremap Kj <Esc>
inoremap KJ <Esc>
nnoremap Y y$

" === Sudo Save ===
command! W w !sudo tee % > /dev/null
