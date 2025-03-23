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
" NEXT THREE CAN UNCOMMENT
autocmd FileType python set shell=ipython
autocmd FileType r set shell=R
autocmd FileType bash set shell=bash
nnoremap <leader>t :vert rightbelow term<CR><C-W><C-W>
"nnoremap <leader>r yy<C-W><C-W><C-W>"0<C-W><C-W>j
"vnoremap <leader>r y<C-W><C-W><C-W>"0<C-W><C-W>gvV
nnoremap <leader>a <esc>:Lexplore<enter>
nnoremap <leader>; :w<enter>:let @" = expand("%")<CR> <bar> :silent !urxvt -hold -e bash --rcfile <(echo '. ~/.bashrc; ./%') & <CR> 
nnoremap <leader>lc :w<enter>:silent !xterm -hold -e bcsh --rcfile <(echo '. ~/.bashrc; ./compile.sh') & <CR>
"noremap <F5> <esc>:!&filetype %<CR>
noremap <F5> <esc> :!xterm -hold -e ' . &filetype . ' %'
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>ss :setlocal spell!<CR>
"vnoremap <silent><Leader>y "yy <Bar> :call system('xclip -sel clip', @y)<CR> :call system('xclip', @y)<CR>
"vnoremap <silent> <Leader>y :<C-U>call system('xclip -sel clip', join(getline("'<", "'>"), "\n"))<CR>
"vnoremap <silent> <Leader>y :<C-U>call system('xclip -sel clip', join(getline("'<", "'>"), "\n") . "\n")<CR>

" For normal mode (sends the current line)
nnoremap <leader>r yy:call SendToTerm()<CR>j

" For visual mode (sends the selected text)
vnoremap <leader>r y:call SendToTerm()<CR>gvVj

" Helper function to send text to the terminal
function! SendToTerm() range
    let l:content = getreg('"')
    let l:paste_start = "\e[200~"
    let l:paste_end = "\e[201~"
    let l:full_content = l:paste_start . l:content . l:paste_end . "\<CR>"

    " Switch to the terminal window (adjust the window navigation as needed)
    execute "normal! \<C-W>w"

    " Send the content to the terminal
    call term_sendkeys('', l:full_content)

    " Switch back to the original window
    execute "normal! \<C-W>w"
endfunction

" Normal mode for terminal
tnoremap <F1> <C-W>N
autocmd QuitPre * call range(1, bufnr('$'))->filter('getbufvar(v:val, "&buftype") == "terminal"')->map('term_setkill(v:val, "hup")')

" For indenting wrapped text properly
set breakindent
set linebreak
"
" Setting the clipboard
set clipboard=unnamedplus

" Make jk do esc
inoremap jk <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>
inoremap JK <esc>
inoremap kj <Esc>
inoremap kJ <Esc>
inoremap Kj <Esc>
inoremap KJ <esc>

" set backups, swp, tmp
set backupdir=/run/media/theop/maindrive/.vim/backup//
set directory=/run/media/theop/maindrive/.vim/swap//
set undodir=/run/media/theop/maindrive/.vim/undo//
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

" Set always equal windows
set equalalways
autocmd VimResized * wincmd = 
