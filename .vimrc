scriptencoding utf-8
filetype off

call plug#begin()

" Plugins
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'chiel92/vim-autoformat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf.vim'
Plug 'keith/swift.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-mix-format'
Plug 'mileszs/ack.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'schickling/vim-bufonly'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'shougo/echodoc.vim'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'thecodedself/syntastic-swift'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code completion
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
Plug 'zchee/deoplete-jedi'
Plug 'slashmili/alchemist.vim'

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
set termguicolors
set updatetime=750
set wildmenu

let g:mapleader = "\<Space>"

inoremap jk <Esc>
nnoremap M <c-w>o
nnoremap <leader>w :w<CR>
nnoremap <silent> <leader>x :qa<cr>
nnoremap <silent> <leader><cr> :noh<cr>
nnoremap <leader>n :e<space>
nnoremap <silent> <leader>b :b#<cr>

" airline {{{ "
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'
" }}} airline "

" autoformat {{{ "
nnoremap <silent> <leader>f :Autoformat<cr>

let g:formatters_ruby = ['rubocop']
" }}} autoformat "

augroup vimrc
  " Remove all vimrc autocomands
  autocmd!

  " Remove whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e
augroup end

" bufonly {{{ "
nnoremap <silent> <leader>Q :BufOnly!<cr>
" }}} "

" deoplete {{{ "
let g:deoplete#enable_at_startup = 1

inoremap <expr><tab> pumvisible()? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible()? "\<c-p>" : "\<s-tab>"
" }}} deoplete "

" echodoc {{{ "
set cmdheight=2

let g:echodoc_enable_at_startup = 1
" }}} echodoc "

" fugitive {{{ "
nmap <silent> <leader>-  :Gstatus<cr><c-n>
nmap <silent> <leader>gb :Gblame<cr>
nmap <silent> <leader>gd :Gvdiff<cr>
nmap <silent> <leader>gg :Gbrowse<cr>

xmap <silent> <leader>gg :Gbrowse<cr>
xmap <silent> <leader>gb :Gblame<cr>
" }}} fugitive "

" Git {{{ "
nnoremap <silent> <leader>gmr :Gmr<cr>
" Git }}} "

command! -nargs=0 Gmr !lab mr -b

source ~/.vimrc_secrets
" fugitive-gitlab {{{ "
let g:fugitive_gitlab_domains = [gitlab_domain]
" }}} fugitive-gitlab "

" NERDTree {{{ "
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden=1

nnoremap <silent> - :NERDTreeFind<cr>
nnoremap <silent> <leader>k :NERDTreeToggle<cr>
" }}} NERDTree "

" neomake {{{ "
augroup neomake_commands
  autocmd!
  autocmd BufWritePost * Neomake
augroup END

let g:neomake_warning_sign = { 'text': '◉', 'texthl': 'NeomakeWarningSign' }
let g:neomake_error_sign   = { 'text': '◉', 'texthl': 'NeomakeErrorSign' }
let g:neomake_message_sign = { 'text': '◉', 'texthl': 'NeomakeMessageSign' }
let g:neomake_info_sign    = { 'text': '◉', 'texthl': 'NeomakeInfoSign' }

let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_elixir_enabled_makers = ['credo']
" }}} neomake "

" swift {{{ "
let g:syntastic_swift_checkers = ['swiftpm', 'swift']

nnoremap <silent> <leader>rs :!swift %<cr>
" }}} swift "

" vim-mix-format {{{ "
let g:mix_format_on_save = 1
" }}} vim-mix-format

" vim-tmux-navigator {{{ "
let g:tmux_navigator_save_on_switch = 2
" }}} vim-tmux-navigator "
"
" Config files quick access
nnoremap <silent> <leader>ee :e! $MYVIMRC<cr>
nnoremap <silent> <leader>es :so $MYVIMRC<cr>
nnoremap <silent> <leader>ez :e! ~/.zshrc<cr>
nnoremap <silent> <leader>et :e! ~/.tmux.conf<cr>

" Navigate panes
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
"

" Navigate buffers
nnoremap <silent> <tab> :bnext<cr>
nnoremap <silent> <s-tab> :bprevious<cr>
nnoremap <silent> <leader>q  :bdelete<cr>

" Create splits
nnoremap <leader>v <c-w>v
nnoremap <leader>h <c-w>s

" fzf {{{ "
set runtimepath+=/usr/local/opt/fzf

nnoremap <silent> <leader>O :Files<cr>
nnoremap <silent> <leader>o :GFiles<cr>
" }}} fzf "

" Tags
nmap t <c-]>

" Ack {{{ "
let g:ackhighlight = 1
let g:ackprg = 'ag --vimgrep --smart-case'

nnoremap <leader>f :Ack! -F ""<left>
xnoremap <leader>f y:Ack! -F "<c-r>""
" }}} Ack "

" tagbar {{{ "
let g:tagbar_compact = 1
nmap <silent> <leader>l :TagbarToggle<CR>
" }}} tagbar "

" Repeat command in last tmux split. "-t !" refers to last pane
nnoremap <silent> <leader>i :silent !tmux send-keys -t \! Up Enter<cr>

" Copy to clipboard
nnoremap <leader>y "+y
xnoremap <leader>y "+y
