" finding files
set path+=**
set wildmenu
   " lua file
   lua require('init')
   " Line numbers
   set number
   " Not case sensitive
   set ignorecase
   " Scroll off
   set scrolloff=5
   " Leader key comma
   " let mapleader = ','
   " Leader key space
   nnoremap <SPACE> <Nop>
   let mapleader=" "

   " Switch tabs
   nnoremap <C-Tab> :tabprevious<CR>
   nnoremap <Tab> :tabnext<CR>

   " Move lines up and down
   nnoremap <s-j> :m .+1<CR>==
   nnoremap <s-k> :m .-2<CR>==
   vnoremap <s-j> :m '>+1<CR>gv=gv
   vnoremap <s-k> :m '<-2<CR>gv=gv

   " use kk to escape insert mode.
   let g:better_escape_shortcut = 'kk'

   " Use ctrl-[hjkl] to select the active split!
   nmap <silent> <c-k> :wincmd k<CR>
   nmap <silent> <c-j> :wincmd j<CR>
   nmap <silent> <c-h> :wincmd h<CR>
   nmap <silent> <c-l> :wincmd l<CR>

   " Find files using Telescope command-line sugar.
   nnoremap <leader>ff <cmd>Telescope find_files<cr>
   nnoremap <leader>fg <cmd>Telescope live_grep<cr>
   nnoremap <leader>fb <cmd>Telescope buffers<cr>
   nnoremap <leader>fh <cmd>Telescope help_tags<cr>


    call plug#begin()
    "Better escape
     Plug 'jdhao/better-escape.vim'
    " Color Scheme
     Plug 'ghifarit53/tokyonight-vim'
    " Auto pairs for '{' '[' '('
     Plug 'jiangmiao/auto-pairs'
    " Better Suntax Support
     Plug 'sheerun/vim-polyglot'
    " File Explorer
     Plug 'scrooloose/NERDTree'
    " Comment Stuff Out
     Plug 'tpope/vim-commentary'
    " GitHub stuff
     Plug 'tpope/vim-fugitive'
    " Status/Tabline
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'
    " Telescope
     Plug 'nvim-lua/plenary.nvim'
     Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
    " Icons
     Plug 'ryanoasis/vim-devicons'
    " Treesitter
     Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "fzf
     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Markdown preview
     Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Markdown table of contents
     Plug 'mzlogin/vim-markdown-toc'
    " terminal in floating window
     Plug 'voldikss/vim-floaterm'
    " Starting page
     Plug 'mhinz/vim-startify'
    " Visual multi
     Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    " LSP
    call plug#end()

" Floaterm keymappings: floating terminal
let g:floaterm_keymap_new = '<Leader>tt'
" let g:floaterm_keymap_new    = '<F7>'
" let g:floaterm_keymap_prev   = '<F8>'
" let g:floaterm_keymap_next   = '<F9>'
" let g:floaterm_keymap_toggle = '<F12>'

 " Airline Themes (tabs)
 let g:airline_theme='tokyonight'
" let g:airline_theme='transparent'

"  Backround
set termguicolors

 let g:tokyonight_style = 'storm' " available: night, storm
 let g:tokyonight_enable_italic = 1
 colorscheme tokyonight

" Automatically displays all buffers when there's only one tab open
" let g:airline#extensions#tabline#enabled = 1

" Always show tabs
set showtabline=2

filetype plugin indent on

let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" air-line
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '


"FZF
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" - Popup window (center of the current window)
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6, 'relative': v:true } }

" - Popup window (anchored to the bottom of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" - down / up / left / right
" let g:fzf_layout = { 'down': '40%' }

" - Window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
" let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:startify_custom_header = [
    \ '                                                       ',
    \ '     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    \ '     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    \ '     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    \ '     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    \ '     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    \ '     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
    \ ]
