set encoding=utf-8
set number
set ruler
syntax on
set smartindent
set autoindent
set cindent
set mouse=a
set t_Co=256
set autoread
set errorbells
set ttyfast
set novisualbell
set laststatus=2
set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set noswapfile
set colorcolumn=80
set linespace=3

set guifont=monaco:h11

set updatetime=100

"Hide scrollbar
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
set signcolumn=yes

"Mapping
map <silent> <C-S-M> :NERDTreeFind<CR>
map <silent> <c-p> :FZF<CR>
map <silent> <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
map <M-s> :w<kEnter>
imap <M-s> <Esc>:w<kEnter>i

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'bling/vim-airline' "Bottom bar custom
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter' "Comment multiple lines : Visual + \ + c + c
Plug 'joshdick/onedark.vim' "Theme similar atom
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'mxw/vim-jsx' "React Syntact
Plug 'prettier/vim-prettier'
Plug 'ruanyl/vim-fixmyjs'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/my-prototype-plugin'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

call plug#end()

colorscheme onedark
