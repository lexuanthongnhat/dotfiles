" vim-plug configuration
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'davidhalter/jedi-vim'
"Plug 'roxma/vim-paste-easy'
Plug 'plasticboy/vim-markdown'

Plug 'metakirby5/codi.vim'
Plug 'jpalardy/vim-slime'

" Add plugins to &runtimepath
call plug#end()

set nocompatible
syntax on
set encoding=utf-8

set backspace=2
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set number
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}] 
set laststatus=2
set relativenumber
set ruler
set cursorline
"hi CursorLine cterm=none ctermbg=14 ctermfg=white guibg=darkred guifg=white 
set colorcolumn=80
"let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=darkgrey

set textwidth=79    " lines longer than 79 columns will be broken
set tabstop=2       " The width of a TAB \t is set to 2.
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set shiftround      " round indent to multiple of 'shiftwidth'
set autoindent      " align the new line indent with the previous line

"set listchars=tab:>.,eol:↵,trail:·,extends:↷,precedes:↶,space:␣
set clipboard=unnamed

" Enable folding
set foldmethod=indent
set foldlevel=99

" Splitting window behavior
set splitbelow
set splitright
" Auto resize Vim's windows according to terminal (Tmux) pane
:autocmd VimResized * wincmd =

set wrap
inoremap jk <ESC>
set pastetoggle=<F2>

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

let mapleader=","

filetype plugin indent on
au BufNewFile,BufRead,BufReadPost *.mustache set syntax=html

"set t_Co=256
let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"set t_Co=16 
set background=dark
colorscheme solarized

"Airline theme - need t_Co=256
let g:airline_theme='solarized'

"Target slime plugin to tmux
let g:slime_target = "tmux" 
