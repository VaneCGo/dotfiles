scriptencoding utf-8
filetype off

call plug#begin()

" Plugins
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'chiel92/vim-autoformat'
Plug 'fishbullet/deoplete-ruby'
Plug 'machakann/vim-highlightedyank'
Plug 'raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'

call plug#end()
filetype plugin indent on

" Settings
colorscheme afterglow

if !has('g:sintax_on')
  syntax enable
endif

if has('nvim')
  set inccommand=split
endif

set autoindent
set autoread
set backspace=indent,eol,start " Fix backspace not deleting tabs, also make delimitMate work
set breakindent
set expandtab
set incsearch
set lazyredraw
set linespace=2
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set number
set relativenumber
set shiftwidth=2
set smartcase
set softtabstop=2
set splitbelow
set splitright
set updatetime=750
set wildmenu

let g:mapleader = "\<Space>"

inoremap jk <Esc>
inoremap <Esc> STAHP
noremap <left> STAHP
noremap <up> STAHP
noremap <right> STAHP
noremap <down> STAHP
nnoremap M <c-w>o
nnoremap <leader>w :w<CR>
nnoremap <silent> <leader><cr> :noh<cr>

" airline {{{ "
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'
" }}} airline "

" autoformat {{{ "
nnoremap <silent> <leader>f :Autoformat<cr>

let g:formatters_ruby = ['rubocop']
" }}} autoformat "

augroup vimrc
  autocmd!

  " Remove whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e
augroup end

" deoplete {{{ "
let g:deoplete#enable_at_startup = 1

inoremap <expr><tab> pumvisible()? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible()? "\<c-p>" : "\<s-tab>"
" }}} deoplete "

" neomake {{{ "
augroup neomake_commands
  autocmd!
  autocmd! BufWritePost * Neomake
augroup END

let g:neomake_ruby_enabled_makers = ['rubocop']
" }}} neomake "

nnoremap <silent> <leader>ee :e! $MYVIMRC<cr>
nnoremap <silent> <leader>es :so $MYVIMRC<cr>

nnoremap <silent> - :NERDTreeFind<cr>
nnoremap <silent> <leader>k :NERDTreeToggle<cr>

" Navigate panes
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
"

set runtimepath+=/usr/local/opt/fzf

" Open files
nnoremap <silent> <leader>O :Files<cr>
nnoremap <silent> <leader>o :GFiles<cr>

let g:ackprg = 'ag --vimgrep --smart-case'

" Copy to clipboard
nnoremap <leader>y "+y
xnoremap <leader>y "+y
