" Contains common key bindings that I want to keep in sync between nvim/IdeaVim/vim 
let mapleader=" "

set nocompatible                                   " Use Vim defaults ( much better! )

set gfn=Courier:h12                                " use this font.

"set autochdir
set backspace=indent,eol,start                     " backspace work right

set iskeyword+=-
"set iskeyword+=$,@,%,#,-                           " these don't act as word separators
set mouse=a                                        " enable mouse

set noerrorbells                                   " no sound! *BLING* *BLING* *BLING* SUCKS!
set belloff=all

set wildmenu                                       " wild menu file listing                                     
set wildignore=*.exe,*.jpg,*.gif,*.png,*\\node_modules\\*   " ignore these files in wild menu.

"set cursorcolumn
"set cursorline
set incsearch                                      " 
set laststatus=2                                   " show status bar always.

set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P " Shows the char code of the curent char
 
set hlsearch                                       " high light the search

set timeoutlen=500

"This sets the cursor line when in insert mode and removes it when out of
"insert mode.
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul


set lazyredraw                                     " don't redraw during macros. 

set number
set relativenumber
set ruler

set showcmd                                        " shows the current command.
set showmatch                                      " cause cursor to show bracket matching

set ignorecase                                     " case insensitive
set infercase                                      " try to guess the case if caps lock is on..
set nowrap    

set smartcase

set guioptions-=T                                  "Get rid  of the tool bar in visual mac vim 
set vb t_vb=                                       "Keeps vim from beeping when a command doesn't work, just flashes

set expandtab                                      " no real tabs.
set shiftwidth=2
set softtabstop=2
set tabstop=2                                      "Make tabs into spaces x spaces 

" Indent to nearest tabstop
set shiftround

set hidden                                         "Lets you switch buffers without saving.
  
" Indentions
set autoindent
set smartindent
filetype plugin indent on

set clipboard=unnamed


"Delete Trailing White spaces.
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Automatically delete trailing white spaces when saving a *.rb file.
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.vue :call DeleteTrailingWS()
autocmd BufWrite *.json :call DeleteTrailingWS()
autocmd BufWrite *.xml :call DeleteTrailingWS()
autocmd BufWrite *.sh :call DeleteTrailingWS()
