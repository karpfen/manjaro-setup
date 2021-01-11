set belloff=all

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'davidhalter/jedi-vim'
" Plugin 'chrisbra/csv.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'dpelle/vim-LanguageTool'
Plugin 'edkolev/tmuxline.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'jalvesaq/Nvim-R'
Plugin 'rhysd/vim-grammarous'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'zxqfl/tabnine-vim'
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set ruler
set relativenumber
set nu "line numbering
set wrap
set textwidth=80
" let &colorcolumn=81
" let &colorcolumn=join(range(81,999),",")
set nojoinspaces
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
autocmd FileType latex,tex,md,markdown,rmd set spell
set complete +=k

" Configuration for https://github.com/airblade/vim-gitgutter
set updatetime=30

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

nnoremap <C-L> :nohls<cr>

" Language tool
let g:languagetool_jar='~/.vim/bundle/vim-grammarous/misc/LanguageTool-4.5/languagetool.jar'
nmap gn :lnext<CR>
nmap gp :lprevious<CR>

" insert timestamp to document
nnoremap <buffer> <F4> :r! date "+\%Y-\%m-\%d \%H:\%M:\%S"<cr>

" autocomplete nested parantheses, etc.
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

:map <F3> :call WC()<CR>
function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    let result = system(cmd)
    echo result . " words"
endfunction

"----------------------------------------
"-------------   Nvim-R   ---------------
"----------------------------------------

" https://github.com/jcfaria/Vim-R-plugin/issues/204
let g:ScreenImpl = 'Tmux'
let g:ScreenShellInitialFocus = 'shell'
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

" stop the plugin remapping underscore to '->':
let R_assign = 0

let R_silent_term = 1

let g:R_in_buffer = 1
"let g:R_rconsole_width = winwidth("%") / 2
let g:R_rconsole_width = 100
let g:R_nvimpager = "horizontal"
let R_args = ['--no-save', '--quiet']
let R_tmux_title = 'R'
let g:R_notmuxconf = 1 "use my .tmux.conf, not the Nvim-r one

let r_syntax_folding = 0

" localvimrc
let g:localvimrc_ask = 0
