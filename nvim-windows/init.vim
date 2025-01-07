" general options
set number
set relativenumber
  
let mapleader=" "

inoremap jj <Esc>

set scrolloff=8
set sidescrolloff=8

set ignorecase
set smartcase

set cursorline

" Show full path in status line
set statusline+=%F

"colorscheme vim
syntax on

" Use 2 spaces for tabs
set tabstop=2

" Use 2 spaces for indentation
set shiftwidth=2

" Convert tabs to spaces
set expandtab

" Copy indent from current line when starting new one
set autoindent

" Use system clipboard as default register
set clipboard+=unnamedplus

call plug#begin()
" List your plugins here
Plug 'folke/tokyonight.nvim'
call plug#end()

" Colorscheme
colorscheme tokyonight-storm


