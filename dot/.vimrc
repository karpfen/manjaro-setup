set belloff=all

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'dpelle/vim-LanguageTool'
Plugin 'rhysd/vim-grammarous'
Plugin 'edkolev/tmuxline.vim'
Plugin 'chrisbra/csv.vim'
call vundle#end()            " required
filetype plugin indent on    " required

" let g:gruvbox_contrast_dark='neutral'
" colorscheme gruvbox
" set background=dark
let g:airline_theme='ubaryd'
" show all open buffers on top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
" nice looking things
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

if has("syntax")
    syntax enable
endif


if has("autocmd")
    " Jump to the last position when reopening a file
    "au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " Load indentation rules and plugins according to the detected filetype.
    " Note these are essential for r-plugin!
    filetype plugin on
    " filetype indent on " set above for vundle
endif

set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search

" Extra config lines 
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set ruler
set relativenumber
set nu "line numbering
set wrap
set textwidth=80
" let &colorcolumn=81
" let &colorcolumn=join(range(81,999),",")
set undofile
set undodir=$HOME/.vim/undo-dir
set undolevels=1000
set undoreload=10000
"global searches, so :%s/foo/bar/g automatically becomes :%s/foo/bar
set gdefault 
"automatically highlight searching
set hlsearch 
" Height of the command bar
set cmdheight=2
set backspace=indent,eol,start

set path+=**
set wildmenu
set wildmode=list:full

" Spell checking
autocmd FileType latex,tex,md,markdown,Rmd set spell
set complete +=k

" Configuration for https://github.com/airblade/vim-gitgutter
set updatetime=30

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

nnoremap <C-L> :nohls<cr>

" Language tool
let g:languagetool_jar='~/.LanguageTool/LanguageTool-4.1/languagetool-commandline.jar'
nmap gn :lnext<CR>
nmap gp :lprevious<CR>

" insert timestamp to document
nnoremap <buffer> <F4> :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<cr>
