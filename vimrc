set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'airblade/vim-gitgutter'
"filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" Put your stuff after this line
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'flazz/vim-colorschemes'
colorscheme Monokai
""""""""
"if has('autocmd')
"    filetype plugin indent on
"endif
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

"set autoindent
set ruler
"set encoding=utf-8
"set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
" Tabs
let g:airline_theme='badwolf'
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
" "nnoremap th :tabnext<CR>
" "nnoremap tl :tabprev<CR>
" "nnoremap tn :tabnew<CR>i
"
" CtrlP
 set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 
