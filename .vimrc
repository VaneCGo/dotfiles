scriptencoding utf-8
filetype off

call plug#begin()

" Plugins
Plug 'OmniSharp/omnisharp-vim'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'chiel92/vim-autoformat'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'iovis/tux.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
Plug 'terryma/vim-multiple-cursors'
Plug 'thecodedself/syntastic-swift'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-projectionist'
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
set background=dark
colorscheme hybrid_reverse

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
set nofixendofline
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
nnoremap <silent> <leader>cp :let @+ = expand('%') . ':' . line('.')<cr>
nnoremap <silent> <down> :cnext<cr>
nnoremap <silent> <up>   :cprevious<cr>
nnoremap <silent> <leader><down> :cnfile<cr>
nnoremap <silent> <leader><up>   :cpfile<cr>
nnoremap <silent> <leader>= <c-w>=

" airline {{{ "
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_material_darker'
" }}} airline "

" autoformat {{{ "
nnoremap <silent> <leader>b :Autoformat<cr>

let g:formatdef_jq = "'jq .'"

let g:formatters_ruby = ['rubocop']
let g:formatters_json = ['jq']
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

" vim-dispatch {{{ "
nnoremap z<cr> :Dispatch<cr>
" }}} vim-dispatch "

" echodoc {{{ "
set cmdheight=2

let g:echodoc_enable_at_startup = 1
" }}} echodoc "

" fugitive {{{ "
nmap <silent> <leader>-  :Git<cr><c-n>

nnoremap <leader>gl :Git pull<cr>

nnoremap <silent> <leader>gb :Git blame<cr>
nnoremap <silent> <leader>gd :Gvdiff<cr>
nnoremap <silent> <leader>gg :GBrowse<cr>
nnoremap <silent> <leader>gh :0Gclog<cr>

xnoremap <silent> <leader>gg :GBrowse<cr>

command! -nargs=0 Gpr !hub pr show
command! -nargs=0 Gprl !hub pr list

nnoremap <silent> <leader>gpr :Gpr<cr>
nnoremap <leader>gprl :Gprl<cr>

nnoremap <silent> <leader>gcom :Git checkout master<cr>
" }}} fugitive "

" Update highlight color
hi Search ctermbg=110 ctermfg=235 guibg=#343434 guifg=white cterm=NONE gui=NONE

" Remove background color for panels vertical split separator
hi VertSplit ctermbg=NONE guibg=NONE

" NERDTree {{{ "
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden=1

nnoremap <silent> - :NERDTreeFind<cr>
nnoremap <silent> <leader>k :NERDTreeToggle<cr>
" }}} NERDTree "

" neomake {{{ "
call neomake#configure#automake('nwr', 1000)

let g:neomake_error_sign   = { 'text': '◉', 'texthl': 'NeomakeErrorSign' }
let g:neomake_info_sign    = { 'text': '◉', 'texthl': 'NeomakeInfoSign' }
let g:neomake_message_sign = { 'text': '◉', 'texthl': 'NeomakeMessageSign' }
let g:neomake_warning_sign = { 'text': '◉', 'texthl': 'NeomakeWarningSign' }

let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_elixir_enabled_makers = ['credo']
let g:neomake_go_enabled_makers = ['golangci_lint']
" }}} neomake "

" projectionist {{{"
nnoremap <silent> <leader>aa :A<cr>
nnoremap <silent> <leader>av :AV<cr>
" }}} projectionist "

" syntastic {{{ "
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_swift_checkers = ['swiftpm', 'swift']
let g:syntastic_cs_checkers = ['code_checker']

nnoremap <silent> <leader>rs :!swift %<cr>
" }}} syntastic "

" vim-mix-format {{{ "
let g:mix_format_on_save = 1
" }}} vim-mix-format

" vim-tmux-navigator {{{ "
let g:tmux_navigator_save_on_switch = 2
" }}} vim-tmux-navigator "

" vim-go {{{ "
let g:go_asmfmt_autosave = 1
" }}} vim-go

" tux {{{ "
augroup mix_commands
  autocmd!
  autocmd FileType elixir nnoremap <silent><leader>sl :execute 'Tux mix test ' . expand('%') . ':' . line('.')<cr>
  autocmd FileType elixir nnoremap <silent><leader>sf :Tux mix test %<cr>
augroup end

augroup rspec_commands
  autocmd!
  autocmd FileType ruby nnoremap <silent><leader>sl :execute 'Tux rspec ' . expand('%') . ':' . line('.')<cr>
  autocmd FileType ruby nnoremap <silent><leader>sf :Tux rspec %<cr>
augroup end
" }}} tux "

" omnisharp {{ "
augroup csharp_commands
  autocmd!
  autocmd FileType cs nnoremap <silent><leader>d :OmniSharpGotoDefinition<cr>
augroup end
" }}} omnisharp "

" go {{{ "
augroup golang_commands
  autocmd!
  autocmd FileType go inoremap <buffer> . .<C-x><C-o>
  autocmd FileType go nnoremap <silent><leader>e :execute 'Tux go run ' . expand('%')<cr>
  autocmd FileType go nnoremap <silent><leader>sf :Tux go test -v ./...<cr>
augroup END
" }}} go "

" Config files quick access
nnoremap <silent> <leader>ee :e! $MYVIMRC<cr>
nnoremap <silent> <leader>es :so $MYVIMRC<cr>
nnoremap <silent> <leader>ep :e! .projections.json<cr>
nnoremap <silent> <leader>et :e! ~/.tmux.conf<cr>
nnoremap <silent> <leader>ez :e! ~/.zshrc<cr>

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
let g:fzf_layout = { 'down': '~40%' }

set runtimepath+=/usr/local/opt/fzf

" Make Rg not list the actual filenames
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   "rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>),
      \   1,
      \   fzf#vim#with_preview({ 'options': '--delimiter : --nth 4..' }, 'right:50%:hidden', 'ç'),
      \   <bang>0
      \ )

nnoremap <silent> <leader>o :Files<cr>
nnoremap <silent> <leader>f :Rg<cr>
" }}} fzf "

" Tags
nmap t <c-]>

" Ack {{{ "
let g:ackhighlight = 1
let g:ackprg = 'rg --vimgrep --smart-case'

nnoremap <leader>F :Ack! -F ""<left>
xnoremap <leader>F y:Ack! -F "<c-r>""
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
