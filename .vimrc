" vim-plug configuration
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'davidhalter/jedi-vim'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'yggdroot/indentline'
Plug 'elzr/vim-json'
Plug 'mechatroner/rainbow_csv'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim'    " distraction-free view

Plug 'inkarkat/vim-ingo-library'    " required for vim-mark
Plug 'inkarkat/vim-mark'

#Plug 'prabirshrestha/async.vim'
#Plug 'prabirshrestha/asyncomplete.vim'
#Plug 'prabirshrestha/vim-lsp'
#Plug 'prabirshrestha/asyncomplete-lsp.vim'
#Plug 'dense-analysis/ale'       " better linting, dianogsis; support black formatter
#Plug 'pdavydov108/vim-lsp-cquery'

Plug 'wellle/tmux-complete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'

" Optional: flake8 diagnostics for Python
"Plug 'alfredodeza/khuno.vim'

Plug 'metakirby5/codi.vim'
#Plug 'jpalardy/vim-slime'

#Plug 'wincent/vim-clipper'
Plug 'machakann/vim-highlightedyank'

" Add plugins to &runtimepath
call plug#end()

set nocompatible
syntax on
set encoding=utf-8

set backspace=2
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set smartcase
set number
set relativenumber
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2
set ruler
set cursorline
"hi CursorLine cterm=none ctermbg=14 ctermfg=white guibg=darkred guifg=white
set colorcolumn=80
"let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=darkgrey

set textwidth=80    " lines longer than this columns will be broken
set tabstop=4       " The width of a TAB \t is set to 2.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set shiftround      " round indent to multiple of 'shiftwidth'
set autoindent      " align the new line indent with the previous line
"set wrap!           " No soft-wrap for long lines

set clipboard=unnamed
nnoremap S "_diwP
:filetype plugin on

" warn tab
syn match tab display "\t"
hi link tab Error
set listchars=tab:>.,eol:↵,trail:·,extends:↷,precedes:↶,space:␣

set clipboard=unnamed

" Enable folding
set foldmethod=indent
set foldlevel=99

" Splitting window behavior
set splitbelow
set splitright
" Auto resize Vim's windows according to terminal (Tmux) pane
:autocmd VimResized * wincmd =

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

" CSV
nmap <leader>csv :set ft=csv<CR>
nmap <leader>tsv :set ft=tsv<CR>

" Copy current file path to system buffer
nmap <leader>cp :let @" = expand("%")<cr><Plug>(ClipperClip)
nmap <leader>cP :let @" = expand("%:p")<cr><Plug>(ClipperClip)

" Tagbar: class outline viewer
nmap <leader>o :TagbarToggle<CR>

nmap <leader>g :Goyo<CR>    " Toogle distraction-free mode
let g:goyo_linenr = 1
let g:goyo_width = 100

" === vim-json ===
let g:vim_json_syntax_conceal = 0

"set t_Co=256
let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"set t_Co=16 
set background=dark
colorscheme solarized8_flat

"Airline theme - need t_Co=256
let g:airline_theme='solarized'

"Target slime plugin to tmux
let g:slime_target = "tmux" 

autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType h setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
