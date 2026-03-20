" Force Vim to dlopen the 3.14 framework (since you built +python3/dyn)
set pythonthreedll=/opt/homebrew/opt/python@3.14/Frameworks/Python.framework/Versions/3.14/Python

" Add venv site-packages to embedded Python path
if has('python3')
python3 << EOF
import os, site, sys
p = os.path.expanduser('~/.venvs/vim314/lib/python3.14/site-packages')
if os.path.isdir(p) and p not in sys.path:
    site.addsitedir(p)
EOF
endif


let mapleader=","

set background=dark
if exists("$VIM_BG") " this is set in the zshrc.
  execute "set background=" . $VIM_BG
endif

if &background ==# "light"
  " LIGHT MODE
  " try a preferred light scheme, fall back if missing
  if exists(":colorscheme")
    silent! colorscheme shine
    " If you have another installed, swap it in above (e.g. PaperColor, solarized, etc.)
  endif
else
  " DARK MODE
  silent! colorscheme slate
  " Swap to your preferred dark scheme (e.g. gruvbox, onedark, etc.)
endif

syntax enable

set nocompatible                                   " Use Vim defaults ( much better! )
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim


call vundle#begin()

" let Vundle manage Vundle
" required! 
"
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"Plugin 'VundleVim/Vundle.vim'


" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'
Plugin 'vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'sheerun/vim-polyglot'

" VueJs
Plugin 'posva/vim-vue'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-dispatch'

Plugin 'tom-doerr/vim_codex'

set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'


call vundle#end()
filetype plugin indent on


" Common Keybindings
source ~/.vim/common_key_bindings.vim

nmap <Leader>n :Explore<CR> " File explorer

source ~/.vim/funcs_keybindings.vim



""""""""""""""""""""""""""""""""
" Vim specific config
"""""""""""""""""""""""""""""""'
" 
" 
" let g:ale_javascript_eslint_executable = '/usr/local/bin/eslint'
" let g:ale_linters = {'javascript': ['eslint']}
"
"
" complete list of ruby linters:
" ['brakeman', 'cspell', 'debride', 'packwerk', 'rails_best_practices', 'reek', 'rubocop', 'ruby', 'solargraph', 'sorbet', 'standardrb', 'steep']
"  let g:ale_linters = {'ruby': ['brakeman', 'ruby', 'rubocop', 'standardrb' ]}
let g:ale_linters = {'ruby': ['brakeman', 'ruby', 'reek' ]}
" 
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \   'ruby': ['rubocop'],
" \}
" 
" " Linter errors in the 'air-line'
" let g:airline#extensions#ale#enabled = 1
"  
" let g:ale_ruby_rubocop_executable = '/Users/cdwetzelberger/.rbenv/shims/rubocop'
" "let g:ale_ruby_rubocop_executable = '/Users/cdwetzelberger/.rbenv/versions/2.4.5/bin/rubocop'
" 
" let g:ale_lint_on_text_changed = 'never'
" " You can disable this option too
" " if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0
" " Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 0
" 
" 
" " ctrl-p ignores the git ignore files. 
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:20'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|swagger'


map <C-S-P> :CtrlPBuffer<CR>

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" 
" 
" 
" " SETUP FOR https://github.com/pangloss/vim-javascript
" let g:javascript_plugin_jsdoc = 1
 
