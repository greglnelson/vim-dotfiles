call pathogen#infect()
call pathogen#helptags()

" No Vi Compatibility. That just sucks.
" set nocompatible

" Convince Vim it can use 256 colors inside Gnome Terminal.
" " Needs CSApprox plugin
set t_Co=256

syntax on
filetype plugin indent on
filetype plugin on

" Colorscheme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" Set <leader> to ',' and <localleader> to "\"
let mapleader=","
let maplocalleader="_"

" Activate a permanent ruler 
set ruler

" Disable Toolbar, Scrollbar
set guioptions-=T
set guioptions-=r

" Disable the blinking cursor.
set gcr=a:blinkon0

" Highlight current line 
if has("gui_running")
  set cursorline
endif

" clipboard stays in sync, just p instead of "+p
" in future version of vim i am too lazy to compile
" use set clipboard = unnamedplus will work for linux X11 env
" but for now, :/
" set clipboard = unnamed
" in the meantime
" Copy/Paste to and from Desktop Environment
noremap <leader>yy "+y
noremap <leader>pp "+gP

" Default tab settings, make tabs two spaces
" May need to change this for space sensitive shared projects
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Don't keep around a permanent backup, but do keep around the temporary
" " backups while a file is being edited (they get deleted on save/exit)
" Move Backup Files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Turn off annoying swapfiles
set noswapfile

" Set persistent undo (v7.3 only)
set undodir=~/.vim/undodir
set undofile

" The PC is fast enough, do syntax highlight syncing from start
" autocmd BufEnter * :syntax sync fromstart

" Searching
set hlsearch
set incsearch
set showmatch

" To get rid of the highlights when desired
nmap <silent> <leader>n :silent :nohlsearch<CR>

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
set laststatus=2
set statusline=[%l,%v\ %P%M][CWD:\ %{CWD()}][FILE:\ %f]\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}\ %#warningmsg#%{SyntasticStatuslineFlag()}%*
set showcmd
set showmode
set number

function! CWD()
    let curdir = substitute(getcwd(), '/home/g', "~/", "g")
    return curdir
endfunction

" utf-8 default encoding
set enc=utf-8

" Plugin Config

" Tagbar - shows ctags in a nice sidebar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" Language Specific


" CoffeeScript
" https://github.com/kchmck/vim-coffee-script folding on
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent
" compile coffeescript files on write
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!
" rewrite tabs into spaces
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Haskell
let g:haddock_indexfiledir="~/.vim/"
let g:haddock_indexfile="~/.vim/.haddock_index.vim"
let g:haddock_browser="/usr/bin/chromium-browser"
let g:haddock_docdir ="/usr/share/doc/ghc-doc/"
au BufEnter *.hs compiler ghc
