source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" For search cases
set infercase

" Colouring
syntax on

" Start and end
noremap <C-j> ^
noremap <C-k> $
noremap <C-l> %

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

" Run current script
nnoremap <F5> <esc>:w<enter>:!%:p<enter>
inoremap <F5> <esc>:w<enter>:!%:p<enter>

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

" for latex
nnoremap <Leader>lr \ref()<Space>(<>)<Esc>T{i
nnoremap <Leader>lc :! ~/system/scripts/compile %:r

" others
vnoremap <silent><Leader>y "yy <Bar> :call system('xclip -sel clip', @y)<CR> :call system('xclip', @y)<CR>

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
