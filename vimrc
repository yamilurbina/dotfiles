set encoding=utf-8
set nocompatible
syntax on
filetype plugin indent on

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-endwise'
call plug#end()

set number
set numberwidth=5
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set splitbelow
set splitright
syntax enable
