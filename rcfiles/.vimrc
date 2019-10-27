if v:progname =~? "evim"
  finish
endif

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

if has('syntax') && has('eval')
  packadd! matchit
endif

" For search cases
set infercase

" Start and end
noremap <C-j> ^
noremap <C-k> $
noremap <C-l> %

" Set encoding
set encoding=utf-8

" For wildmenu
set wildmenu
set wildmode=full
set wildcharm=<Tab>
nnoremap <leader><Tab> :buffer<Space><Tab>

" For the numbering
set number
set relativenumber!

" For global defaults
set gdefault

" Run current script
nnoremap <F5> <esc>:w<enter>:!%:p<enter>
inoremap <F5> <esc>:w<enter>:!%:p<enter>

" proper navigation
noremap ; l
noremap l k
noremap k j
noremap j h

" clipboard integration?
set clipboard=unnamedplus

" make jk do esc
inoremap jk <Esc>
vnoremap jk <Esc>

" For latex writing
inoremap ;r \ref()<Space>(<>)<Esc>T{i
inoremap ;c :! ./compile.sh
" Display name of file
set statusline +=%{resolve(expand('%:p'))}\ %*

" For xclip integration
function! Copying()
    silent !clear
    execute "!xclip -selection clipboard " . @y
endfunction

vnoremap <silent><Leader>y "yy <Bar> :call Copying()<CR>
