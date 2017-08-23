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
set gfn=Monaco:h14

call plug#begin('~/.vim/plugged')

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mustache/vim-mustache-handlebars' "Ember handlebar
  Plug 'pangloss/vim-javascript'
  Plug 'bling/vim-airline' "Bottom bar custom
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/nerdcommenter' "Comment multiple lines : Visual + \ + c + c
  Plug 'joshdick/onedark.vim' "Thene looks like atom
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'jiangmiao/auto-pairs'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/vim-easy-align'
  Plug 'https://github.com/junegunn/vim-github-dashboard.git'
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
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
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

call plug#end()


colorscheme onedark
