" reference to https://github.com/Howon/Config/blob/master/vimrc
" : https://github.com/hmontero1205/dotfiles/blob/master/.vimrc
" : https://github.com/j-hui/pokerus/blob/master/vim/.vimrc#L529
"
"Sets how many lines of history VIM has to remember
set autoread "set to auto read when a file is changed from the outside

" With a map leader it is possible to do extra key combination
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" -----------Buffer Management---------------
set hidden " Allow buffers to be hidden if you've modified a buffer, In default, it will display an error. better to hide the buffer

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Copy purpose for Clipboard
vmap <leader>y "+y
vmap <leader>p "+p

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
" Be smart when using tabs
" Auto indents based on indentation level.
set autoindent
set smartindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set number
set nrformats-=octal
set mouse=a
set ttimeout
set ttimeoutlen=100
set laststatus=2
set ruler
set showcmd
set wildmenu
set scrolloff=10
set cursorline "the magic cursor line

" Highlight search results
set hlsearch

" For regular expressions turn magic on
set magic

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" File specific tabbing scheme
autocmd Filetype c,h setlocal ts=8 sw=8 cindent
autocmd Filetype cpp,hpp,cxx setlocal ts=2 sw=4 expandtab
autocmd Filetype python setlocal ts=4 sw=4 softtabstop=4 expandtab autoindent
autocmd Filetype java,go,html,javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype markdown setlocal ts=4 sw=4 softtabstop=4 textwidth=80 expandtab

" trailing space
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

set fileformats+=mac

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

inoremap <C-U> <C-G>u<C-U>

" Airline
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" ctrl-p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>  " enter file search mode

" Nerdtree
autocmd VimEnter * NERDTree " open Nerdtree while starting
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree
nmap <leader>r :NERDTreeFocus<CR> \|R \| <c-w><c-p> "custom map for refersh

" Emmet
let g:user_emmet_mode='a'    "enable all function in all mode.

" vim-css-color
let g:cssColorVimDoNotMessMyUpdatetime = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf ='~/.vim/.ycm_extra_config.py'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Commenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define plugins to install
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Browse the file system
Plug 'scrooloose/nerdtree'
" Ctrlp
Plug 'kien/ctrlp.vim'
" YCM
Plug 'Valloric/YouCompleteMe'
" Emmet
Plug 'mattn/emmet-vim'
" CSS-Color
Plug 'skammer/vim-css-color'
" vim javascript
Plug 'pangloss/vim-javascript'
" NERD Commenter, Plugins always are easier than self-written functinos XD
Plug 'preservim/nerdcommenter'

" All of your Plugins must be added before the following line
call plug#end()

