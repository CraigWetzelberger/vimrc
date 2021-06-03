let mapleader=","

set background=dark

syntax enable
colorscheme industry

set nocompatible                                   " Use Vim defaults ( much better! )
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim


call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/vundle'


" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-unimpaired'
Plugin 'wakatime/vim-wakatime'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'vim-airline'

" VueJs
Plugin 'posva/vim-vue'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-dispatch'

set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'


call vundle#end()
filetype plugin indent on

set gfn=Courier:h12                                " use this font.

"set autochdir
set backspace=indent,eol,start                     " backspace work right

set iskeyword+=$,@,%,#,-                           " these don't act as word separators
set mouse=a                                        " enable mouse

set noerrorbells                                   " no sound! *BLING* *BLING* *BLING* SUCKS!

set wildmenu                                       " wild menu file listing                                     
set wildignore=*.exe,*.jpg,*.gif,*.png,*\\node_modules\\*   " ignore these files in wild menu.

"set cursorcolumn
"set cursorline
set incsearch                                      " 
set laststatus=2                                   " show status bar always.

set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P " Shows the char code of the curent char
 
set hlsearch                                       " high light the search

"This sets the cursor line when in insert mode and removes it when out of
"insert mode.
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

set lazyredraw                                     " don't redraw during macros. 

set number
set ruler
"set scrolloff=10

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

" Make command mode a bit more responsive to typical 
" editing/formating keys, like space backspace and Enter
:map <Space> i <Esc>l
:map <Backspace> "_dh
:map <PageDown> <C-d>
:map <PageUp> <C-b>
:map <CR> i <CR><Esc>

"disable help typing help is not such a burden.
:map <F1> <Esc>
:imap <F1> <Esc>
:imap jj <Esc> 

:nnoremap ; :

"Vimdiff Ignore white spaces
"set diffopt+=iwhite

"Lets you pass a visual block to perl titdy by pushgin "="
" autocmd Filetype perl :set equalprg=perltidy


" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Make tab in v mode work like I think it should (keep highlighting):
" vmap <tab> >gv
" vmap <s-tab> <gv


" Undo in insert mode.
imap <c-z> <c-o>u

" Turn on and off NERDTree 
" normal nerd tree.
"map <F5> :NERDTreeToggle<CR><ESC>
  

" Toggle nerd tree with vim-nerdtree-tabs
" map <F7> :NERDTreeTabsToggle<CR><ESC>

"autocmd BufNewFile,BufRead *.java imap . .<c-x><c-o>


"autocmd BufNewFile,BufRead *.java imap <c-Space> blah<c-x><c-u>
imap <c-Space> blah<c-x><c-u>


"Lets you do cross platform .vimrc settings
if has('mac')
  "Back up files to ~/.vim/backup
  set backup
  set backupdir=~/.vim/backup

  " Author:  Benji Fisher <benji@member.AMS.org>
  " Last modified:  8 May 2006
  " TODO:  Is there a better way to tell that Vim.app was started from Finder.app?
  " Note:  Do not move this to the gvimrc file, else this value of $PATH will
  " not be available to plugin scripts.
  if has("gui_running") && system('ps xw | grep "Vim -psn" | grep -vc grep') > 0
    " Get the value of $PATH from a login shell.
    " If your shell is not on this list, it may be just because we have not
    " tested it.  Try adding it to the list and see if it works.  If so,
    " please post a note to the vim-mac list!
    if $SHELL =~ '/\(sh\|csh\|bash\|tcsh\|zsh\)$'
      let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
      let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
    endif
  endif
elseif has('win32')
  "Back up files to ~/.vim/backup
  set backup
  silent execute '!mkdir "'.$HOME.'/backup"'
  set backupdir=$HOME/backup
elseif has ('unix')
  "Back up files to ~/.vim/backup
  set backup
  set backupdir=~/.vim/backup
endif

"exuberant ctag support
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set tags=tags;/

filetype plugin on
runtime macros/matchit.vim


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


" In rails opens rspec in a split window to the left. 
func! OpenRspecVertSplit()
  let filename_with_path =  @%
  let split_filename = split( filename_with_path, "/" )
  if split_filename[0] == 'app'
    let split_filename[0] = 'spec'
  else
    let split_filename[0] = 'spec/' . split_filename[0] 
  endif

  let is_view = 0 " false
  if split_filename[1] == 'views'
    let is_view = 1
  endif

  let last_index = len(split_filename) - 1

  if is_view == 0
    " normally it is change the end to _spec.rb
    let fname = split_filename[last_index]
    let fparts = split(fname, ".rb")
    let split_filename[last_index] = fparts[0] . '_spec.rb'
  else
     " if views then change the end to .erb_spec.rb
    let fparts = split( split_filename[last_index], ".erb")
    let split_filename[last_index] = fparts[0] . '.erb_spec.rb'
  endif

  let file_to_open = join(split_filename, "/")

   exe "vsplit " . file_to_open
endfunc

" In Javascript file open spec.js window to the left.
func! OpenJestVertSplit()
  let filename_with_path =  @%
  let split_filename = split( filename_with_path, "/" )
  if split_filename[0] == 'app'
    let split_filename[0] = 'spec'
  else
    let split_filename[0] = 'spec/' . split_filename[0] 
  endif

  let last_index = len(split_filename) - 1

  let is_vue = 0 " false
  if match(split_filename[last_index], '\.vue$') >= 0
    let is_vue = 1
  endif

  if is_vue == 0
    " normally it is change the end to _spec.rb
    let fname = split_filename[last_index]
    let fparts = split(fname, ".js")
    let split_filename[last_index] = fparts[0] . '.spec.js'
  else
     " if views then change the end to .erb_spec.rb
    let fname = split_filename[last_index]
    let fparts = split( fname, ".vue")
    let split_filename[last_index] = fparts[0] . '.spec.js'
  endif

  let file_to_open = join(split_filename, "/")

   exe "vsplit " . file_to_open
endfunc

func! OpenTestVertSplit()
  let file_ext = expand('%:e') " :r filename  :e extension :t whole thing.

  if file_ext == "js" || file_ext == "vue"
    call OpenJestVertSplit()
  else
    call OpenRspecVertSplit()
  endif
endfunc

func! FilenameToCopyBuffer()
  let @+ = @%
endfunc

func! FilenameAddToCopyBuffer()
  let @+ = @+ . ' ' . @%
endfunc

func! RunRspecCommandToCopyBuffer()
  :update
  let @+ = 'bundle exec rspec ' . @%
endfunc

func! RunRspecCommandCurrentLineToCopyBuffer()
  :update
  let @+ = 'bundle exec rspec ' . @% . ':'. line('.')
endfunc

func! RunZeusRspecCommandToCopyBuffer()
  let @+ = 'zeus rspec ' . @% . ':' . line('.')
endfunc

func! FilenameToCopyBufferWithTrailingSpace()
  let @+ =  @+ . ' ' . @% 
endfunc

func! GetDebuggerStatement()
  let file_ext = expand('%:e') " :r filename  :e extension :t whole thing.

  let output_str = "byebug; puts \"breakpoint\";"
  if file_ext == "js"
    let output_str = "debugger; //eslint-disable-line no-debugger"
  endif

  if file_ext == "vue"
    let output_str = "debugger; //eslint-disable-line no-debugger"
  endif

  exec ":normal o ". output_str 
endfunction
 
" Remember to debug vimscript start vim -D then use :debug call FuncNam
" commands cont, step, echo to evaluate. http://inlehmansterms.net/2014/10/31/debugging-vim/

" LEADER MAPPINGS
nmap <Leader>n :NERDTreeToggle<CR>
"nmap <Leader>d i byebug; puts "breakpoint";<CR>debugger; //eslint-disable-line no-debugger<CR>
nmap <Leader>d :call GetDebuggerStatement()<CR>
nmap <Leader>s :call OpenTestVertSplit()<CR>
nmap <Leader>f :call FilenameToCopyBuffer()<CR>
nmap <Leader>F :call FilenameAddToCopyBuffer()<CR>
nmap <Leader>c :call FilenameToCopyBufferWithTrailingSpace()<CR>

nmap <Leader>r :call RunRspecCommandToCopyBuffer()<CR>
nmap <Leader>e :call RunRspecCommandCurrentLineToCopyBuffer()<CR>
nmap <Leader>z :call RunZeusRspecCommandToCopyBuffer()
noremap <Leader>w :update<CR>


func! EncodeSelectedXml()
  exe "'<,'>s/</&lt;/gc"
  gv
  exe "'<,'>s/>/\&gt;/gc"
endfunc


function VisualLength()
  exe 'normal "xy'
  echo "Visual: " . strlen(@x) . "\n"
  exe 'normal gv'
endfunction


"Ruby syntax settings see:
"https://github.com/vim-ruby/vim-ruby/blob/master/doc/ft-ruby-syntax.txt 
let ruby_space_errors = 1
let ruby_spellcheck_strings = 1

" Add ruby syntax support for casper reports.
au BufNewFile,BufRead *.casper set filetype=ruby
au BufNewFile,BufRead *.task set filetype=ruby


set spell
highlight clear SpellBad

"highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight SpellBad term=underline cterm=underline
highlight clear SpellCap  " words that normally should be capitalized
highlight SpellCap term=NONE cterm=NONE
highlight clear SpellRare " words that are rarely used. 
highlight SpellRare term=NONE cterm=NONE
highlight clear SpellLocal
highlight SpellLocal term=NONE cterm=NONE


let g:ale_javascript_eslint_executable = '/usr/local/bin/eslint'
let g:ale_linters = {'javascript': ['eslint']}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}

" Linter errors in the 'air-line'
let g:airline#extensions#ale#enabled = 1
 
let g:ale_ruby_rubocop_executable = 'bin/rubocop'
"let g:ale_ruby_rubocop_executable = '/Users/cdwetzelberger/.rbenv/versions/2.4.5/bin/rubocop'

let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
" Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 0


" ctrl-p ignores the git ignore files. 
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:20'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|swagger'

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


