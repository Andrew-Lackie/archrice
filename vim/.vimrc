set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/nerdcommenter'
Plugin 'uiiaoo/java-syntax.vim'
Plugin 'frazrepo/vim-rainbow' 
Plugin 'ap/vim-css-color'  
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf'
Plugin 'mcchrish/nnn.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jiangmiao/auto-pairs'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'itsvinayak/image.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'iamcco/markdown-preview.nvim' 
Plugin 'Rigellute/rigel'
call vundle#end()            
filetype plugin indent on  

" Turn syntax highlighting on.
syntax on
" Add numbers to each line on the left-hand side.
set number
" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn
" Do not save backup files.
set nobackup
" While searching though a file incrementally highlight matching characters as you type.
set laststatus=2

let g:rigel_lightline = 1
let g:lightline = { 'colorscheme': 'Tomorrow_Night_Eighties' }

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
colorscheme default
set background=light
set t_ut=""

" Cursor
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

"=== VimWiki ===  
let g:vimwiki_list = [
                 \{'path': '~/Documents/VimWiki/', 'syntax': 'markdown', 'ext': '.md'},
                 \{'path': '~/Documents/VimWiki/academia', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/academia/computer-science', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/academia/mathematics', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/academia/physics', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/academia/russian', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/finance', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/finance/algo-books', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/finance/algo-lib', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/finance/definitions', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/hacking', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/hacking/hacking-tools', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/hacking/hacking-lib', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/ml', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/programming', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/programming/bash', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/programming/c-cpp', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/programming/java', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/programming/javascript', 'syntax': 'markdown', 'ext': '.md'},
                  \{'path': '~/Documents/VimWiki/programming/python', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', 'mdown': 'markdown'}
let g:vimwiki_markdown_link_ext = 1
let g:taskwiki_markup_syntax = 'markdown'

"=== Vim-Markdown ===
let g:markdown_folding = 2 
set conceallevel=2
let g:vim_markdown_conceal = 2 
let g:vim_markdown_conceal_code_blocks = 2 
let g:vim_markdown_fenced_languages = ['html', 'python=py', 'bash=sh', 'css', 'javascript', 'js=javascript', 'json=javascript', 'sass', 'xml', 'jsx=javascript.jsx',]

"=== Markdown-Preview ===
let g:mkdp_browser = 'firefox'
let g:mkdp_command_for_global = 1
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1

