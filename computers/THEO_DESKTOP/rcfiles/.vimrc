source $VIMRUNTIME/defaults.vim
set clipboard=unnamed
set pastetoggle=<F10>

" omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" python setup
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber!
filetype indent on
set autoindent
set encoding=utf-8
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cWORD>")<CR>
autocmd FileType python nnoremap <F5> <esc>:w<enter>:!%:p<enter>
autocmd FileType python inoremap <Leader>m if __name__ == "__main__":<enter>
autocmd FileType python nnoremap <Leader>h ggO#!/usr/bin/env python3
autocmd FileType python set omnifunc=python3complete#Complete

" latex setup
autocmd FileType tex inoremap <Leader>a \autoref{}<Space><Esc>T{i
autocmd FileType tex inoremap <Leader>c \cite{}<Space><Esc>T{i
autocmd FileType tex inoremap <Leader>g \gls{}<Space><Esc>T{i
autocmd FileType tex inoremap <Leader>l \label{}<Space><Esc>T{i
autocmd FileType tex map <F5> <esc>:wa<enter>:!~/system/scripts/com %<enter><enter>
autocmd FileType tex map <leader>ss :setlocal spell!<cr>

" commenting 
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent><Leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent><Leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" For search cases
set infercase

" Proper yank
nnoremap Y y$ 

" Colouring
syntax on

" Remove stupid sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Sudo saves the file
command! W w !sudo tee % > /dev/null

" For wildmenu
set wildmenu
set wildmode=list:longest,full
set wildcharm=<Tab>
set hidden
nnoremap <leader><Tab> :buffer<Space><Tab>

" For global defaults
" set gdefault

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

" linux copypaste
vnoremap <silent><Leader>y "yy <Bar> :call system('xclip -sel clip', @y)<CR> :call system('xclip', @y)<CR>

" set backups, swp, tmp
set nobackup
set nowritebackup
set noswapfile
set undodir=~/.vim/undo/,/tmp//
set undofile

" Display name of file
set statusline +=%{resolve(expand('%:p'))}\ %*

" good background colouring
set background=dark

" cycle through buffers
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <leader>l :ls<CR>
nnoremap <leader>n :bn<CR>
nnoremap <F12> :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" mergetool for 1,2,3 for local base and remote
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif
