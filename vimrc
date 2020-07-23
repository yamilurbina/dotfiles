set encoding=utf-8
set nocompatible
syntax on
filetype off
filetype plugin indent on

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-endwise'
Plug 'majutsushi/tagbar'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

let NERDTreeShowHidden=1
set completeopt-=preview

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:terraform_completion_keys = 1
let g:terraform_registry_module_completion = 0

set noerrorbells
set nobackup
set nowritebackup
set noswapfile
set hidden
set ruler

set number
set numberwidth=5
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set splitbelow
set splitright

set wrap
set textwidth=80

set norelativenumber
set scrolloff=1

set autoindent
set smartindent
set showmatch
set smarttab

set cmdheight=2
set updatetime=300
set signcolumn=yes
set noshowmode
