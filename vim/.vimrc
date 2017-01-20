set ai
set showmode
set ruler
syntax on 
set mouse=a

" tabs
set ts=4
set softtabstop=4 
set shiftwidth=4
set shiftround
set expandtab

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" backup/swap files
set nobackup
set nowritebackup
set noswapfile

set bs=2
filetype on
set number
set nowrap
set tw=80
set colorcolumn=80
" highlight ColorColumn ctermbg=100
nnoremap  :set nonumber!:set foldcolumn=0

"set modelines=0

set go-=L

" leader shortcuts...
let mapleader=","

nnoremap <leader><space> :noh<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>1 :b1<cr>

" T-Comment Shortcut
map <leader>c <c-_><c-_>

"split mappings
map <leader>v :vsplit<cr>
map <leader>h :split<cr>

" vdebug breakpoint
map <leader>b :Breakpoint<cr>

" taglist
map <leader>t :TlistToggle<cr>

" nertree
map <leader>n :NERDTreeToggle<cr>

" quick insert date
map <leader>d :r!date<cr>

" comment out var dumps
map <leader>C :g/var_dump/norm gcc<cr>

" copy to clipboard
map <leader>y "+y 

" spelling
nnoremap <leader>s :setlocal spell! spelllang=en_us<cr>
map <leader>S z=

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" toggle paste mode  (turns off auto indent)
set pastetoggle=<leader>p

" hide buffers instead of closing them.  
" (This way you don't have to save when switching between buffers)
set hidden

" autosource the vimrc when it changes
autocmd! bufwritepost .vimrc source % 

" enable colours
set t_Co=256

" colour scheme
set background=dark
colorscheme monochrome

" pathogen settings
call pathogen#infect()
call pathogen#helptags()
call pathogen#infect()

" Always show the status line
set laststatus=2

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'rw'
" don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**,*/node_modules/**

" completion options
filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set completeopt=longest,menuone

" macvim settings
set guioptions-=r
set guifont=Monaco:h13
set antialias
if has("gui_macvim") 
    set transparency=5
endif

" hate the beeping
set visualbell
set noerrorbells

" new vertical splits open on the right side
set splitright

" Automatically read files when they were changed on the filesystem 
set autoread

" phpdoc settings
autocmd FileType php inoremap <C-d> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php inoremap <C-d> <ESC>:call PhpDocSingle()<CR>
autocmd FileType php inoremap <C-d> <ESC>:call PhpDocRange()<CR>

"Tag list settings
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Inc_Winwidth=1
let Tlist_Compact_Format=1
let Tlist_Highlight_Tag_On_BufEnter=1

" Ultisnip settings
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsEditSplit="vertical"
map <leader>e :UltiSnipsEdit<cr>

" Fix wrapline colour 
highlight NonText ctermbg=none
hi Normal ctermbg=none
highlight ColorColumn ctermbg=0

au FileType javascript setlocal ts=2 sw=2 sts=2 noexpandtab
au FileType html setlocal ts=2 sw=2 sts=2 noexpandtab
 
let g:syntastic_javascript_checkers=['eslint']
 
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
 
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab | 
    \ set autoindent | 
    \ set fileformat=unix |
 
 
let NERDTreeIgnore = ['\.pyc$']
 
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|\.pyc'
 
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

