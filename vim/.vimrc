"==========================
"=  Basic Configurations  =
"==========================
set nocompatible
filetype off                  " required

"=============================================================================

"=============
"=  Plugins  =
"=============

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'mcchrish/nnn.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'itsvinayak/image.vim'
Plug 'Rigellute/rigel'

" Development

Plug 'preservim/nerdcommenter'
Plug 'ap/vim-css-color'
Plug 'uiiaoo/java-syntax.vim'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

" VimWiki

Plug 'vimwiki/vimwiki'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

"=============================================================================

"============================
"  Advanced Configurations  =
"============================

filetype plugin indent on

" Turn syntax highlighting on.
syntax on
" Add numbers to each line on the left-hand side.
set number relativenumber
" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn
" Do not save backup files.
set nobackup
" While searching though a file incrementally highlight matching characters as you type.
set laststatus=2

let g:rigel_lightline = 1
let g:lightline = { 'colorscheme': 'srcery_drk' }

" Lightline
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" Uncomment if colorscheme enabled
"set termguicolors
" This will allow you to search specifically for capital letters.
let g:rainbow_active = 1
" Enable global rainbow brackets
set smartcase
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
" Set the commands to save in history default number is 20.
set history=1000
" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

vmap <Tab> >
vmap <S-Tab> <

" Color Scheme
packadd! dracula
syntax enable
set background=light
set t_ut="256"
set hlsearch
hi Search ctermbg=green
hi Search ctermfg=black
hi Error ctermbg=red
hi Error ctermfg=black
hi ALEError ctermbg=red
hi ALEError ctermfg=black

" Cursor
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

"=============================================================================

"=================
"=  Development  =
"=================

let g:ale_linters = {
  \   'javascript': ['eslint'],
  \}

let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'python': ['black'],
  \   'javascript': ['prettier-eslint'],
  \}

let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>'

"=============================================================================

"==============
"=  Mappings  =
"==============

" Preview HTML file in firefox
nnoremap <F5> :silent update<Bar>silent !firefox %:p &<CR>
nnoremap <F12> :set hlsearch!<CR>
nnoremap <F2> :ALEToggle<CR>

"=============================================================================

"=============
"=  VimWiki  =
"=============

let g:vimwiki_list = [
                 \{'path': '~/Notes/', 'syntax': 'markdown', 'ext': '.md'},
                 \{'path': '~/Notes/academia', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/academia/computer-science', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/academia/mathematics', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/academia/physics', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/academia/russian', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/finance', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/finance/algo-books', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/finance/algo-lib', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/finance/definitions', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/hacking', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/hacking/hacking-tools', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/hacking/hacking-lib', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/ml', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/programming', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/programming/bash', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/programming/c-cpp', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/programming/java', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/programming/javascript', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Notes/programming/python', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', 'mdown': 'markdown'}
let g:vimwiki_markdown_link_ext = 1
let g:taskwiki_markup_syntax = 'markdown'

"=============================================================================

"==================
"=  Vim-Markdown  =
"==================

let g:markdown_folding = 2
set conceallevel=2
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 2
let g:vim_markdown_fenced_languages = ['html', 'python=py', 'bash=sh', 'css', 'javascript', 'js=javascript', 'json=javascript', 'sass', 'xml', 'jsx=javascript.jsx',]

"=== Markdown-Preview ===

let g:mkdp_browser = 'firefox'
let g:mkdp_command_for_global = 1
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:ale_lint_on_enter = 0

"=============================================================================
