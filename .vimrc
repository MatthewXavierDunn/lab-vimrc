" SETTINGS {{{

" misc
set nocompatible
set backspace=indent,eol,start
set ttimeout
set ttimeoutlen=100
set display+=lastline
set display+=truncate
set formatoptions+=j
set encoding=UTF-8
filetype plugin on
filetype indent on

" save & backup
set nobackup
set autoread
set history=1000
set sessionoptions-=options
set viewoptions-=options

" scroll
set scrolloff=10
set sidescroll=1
set sidescrolloff=10

" status line
set laststatus=2
set showcmd
set showmode
set wildmenu
set wildmode=list:longest

" line numbers
set number
set relativenumber

" indentation
set autoindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" whitespace
" set listchars=space:•,trail:·,eol:⏎,tab:▸\ 
set listchars=trail:·,tab:▸\ 

" lines
set nowrap
set textwidth=80
set ruler
set cursorline

" search
set incsearch
set ignorecase
set smartcase

" appearance
set termguicolors
set background=dark
set signcolumn=yes

" split views
set splitbelow
set splitright

" cursor style
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" }}}


" PLUGINS {{{

call plug#begin("~/.vim/plugged")

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

  Plug 'junegunn/vim-easy-align'
  Plug 'jiangmiao/auto-pairs'

  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'pacokwon/onedarkhc.vim'

  Plug 'airblade/vim-gitgutter'
  Plug 'Yggdroot/indentLine'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'dense-analysis/ale'
  Plug 'jayli/vim-easycomplete'
  Plug 'SirVer/ultisnips'
  Plug 'lervag/vimtex'

call plug#end()

" airline
let g:airline_theme = "onedark"
let g:airline_powerline_fonts = 1

" indent guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1

" NT git status
let g:NERDTreeGitStatusUseNerdFonts = 1

" onedarkhc
colorscheme onedarkhc

" vimtex
let g:vimtex_view_method = "zathura"

" }}}


" MAPPINGS {{{

let mapleader = " "

" misc
nnoremap <leader>nh :nohlsearch<CR>

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Lines<CR>
nnoremap <leader>? :Commands<CR>

" tab switching
nnoremap gn :tabNext<CR>
nnoremap gN :tabprevious<CR>
nnoremap gp :tabprevious<CR>
nnoremap gP :tabNext<CR>
nnoremap <leader>c :tabclose<CR>

" view switching
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" redo
nnoremap U :redo<CR>

" folds
nnoremap <leader>fo :foldopen<CR>
nnoremap <leader>fc :foldclose<CR>

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" nerdtree
nnoremap <leader>nt :NERDTreeMirror<CR>:NERDTreeToggle<CR>

" ALE
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>
nnoremap <leader>r :ALERename<CR>
nnoremap <leader>a :ALECodeAction<CR>
nnoremap <leader>k :ALEHover<CR>

" }}}


" VIMSCRTIPT {{{

" Code folding
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup end

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" }}}


" STATUS LINE {{{


" }}}
