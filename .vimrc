set nocompatible
set noswapfile

set number
set ruler

syntax on
execute pathogen#infect()

" Set encoding
set encoding=utf-8

" Whitespace stuff
set list listchars=tab:\ \ ,trail:·
set autoindent
set smartindent
set nowrap
set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab
set nosmarttab
set formatoptions+=n
set textwidth=80
set virtualedit=block

" provide some context when editing
set scrolloff=3

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10

" Color scheme
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark

" Hide scrollbars
set guioptions=aAce

" Show (partial) command in the status line
set showcmd

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Remapping
let mapleader = ","

" Command-T configuration
let g:CommandTMaxHeight=10

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>


" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>


if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif
