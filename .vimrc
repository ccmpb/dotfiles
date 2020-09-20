call plug#begin('~/dotfiles/vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
au BufRead /tmp/mutt-* set tw=72 " for mutt

autocmd Filetype html setlocal ts=2 sw=2 sts=0
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0
autocmd! bufwritepost .vimrc source % " autosource the vimrc when it changes

cnoreabbrev Ack Ack!

colorscheme gruvbox

command! Maketags !ctags -R

filetype indent on
filetype on
filetype plugin on

hi Normal ctermbg=none
highlight ColorColumn ctermbg=0
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterChangeDelete ctermfg=4
highlight GitGutterDelete ctermfg=1
highlight NonText ctermbg=none " Fix wrapline colour
highlight clear SignColumn

let NERDTreeIgnore = ['\.pyc$', '\.__pycache__$']
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:ack_use_cword_for_empty_search = 1
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case --ignore-file ~/.gitignore_global'
let g:airline_powerline_fonts = 1
let g:airline_section_z = "%3p%% %l:%c"
let g:airline_theme='gruvbox'
let g:ale_python_flake8_executable = 'python3'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 'rw'
let g:gitgutter_override_sign_column_highlight = 0
let mapleader=","

map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <leader>S z=
map <leader>b :Breakpoint<cr>
map <leader>c <c-_><c-_> " T-Comment Shortcut
map <leader>d :r!date<cr>
map <leader>e :UltiSnipsEdit<cr>
map <leader>h :split<cr>
map <leader>n :NERDTreeToggle<cr>
map <leader>t :TlistToggle<cr>
map <leader>v :vsplit<cr>
map <leader>y "+y
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap  :set nonumber!:set foldcolumn=0
nnoremap <Leader>g :Ack!<Space>
nnoremap <leader>1 :b1<cr>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>s :setlocal spell! spelllang=en_us<cr>
nnoremap <leader>w <C-w>v<C-w>l

set ai
set autoread
set background=dark
set bs=2
set cmdheight=2 " Give more space for displaying messages.
set colorcolumn=80
set completeopt=longest,menuone
set cursorline
set encoding=utf-8
set expandtab
set go-=L
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2 " Always show the status line
set mouse=
set nobackup
set noerrorbells
set noswapfile
set nowrap
set nowritebackup
set number
set pastetoggle=<leader>p " toggle paste mode  (turns off auto indent)
set ruler
set runtimepath^=~/.vim/bundle/ctrlp.vim
set shiftround
set shiftwidth=4
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set showmode
set smartcase
set softtabstop=4
set splitright
set t_Co=256 " enable colours
set ts=4
set tw=80
set undodir=$HOME/.vim/undo " where to save undo histories
set undofile                " Save undos after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set updatetime=100
set visualbell
set wildignore+=*/vendor/**,*/node_modules/**,*.pyc,*venv/**

syntax on

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction" TextEdit might fail if hidden is not set.

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=no
endif
