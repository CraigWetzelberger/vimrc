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

set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'


call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""
" Vim specific config
"""""""""""""""""""""""""""""""'
" 
" 
" let g:ale_javascript_eslint_executable = '/usr/local/bin/eslint'
" let g:ale_linters = {'javascript': ['eslint']}
" 
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \   'ruby': ['rubocop'],
" \}
" 
" " Linter errors in the 'air-line'
" let g:airline#extensions#ale#enabled = 1
"  
" let g:ale_ruby_rubocop_executable = 'bin/rubocop'
" "let g:ale_ruby_rubocop_executable = '/Users/cdwetzelberger/.rbenv/versions/2.4.5/bin/rubocop'
" 
" let g:ale_lint_on_text_changed = 'never'
" " You can disable this option too
" " if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0
" " Set this in your vimrc file to disabling highlighting
" let g:ale_set_highlights = 0
" 
" 
" " ctrl-p ignores the git ignore files. 
" let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:20'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_custom_ignore = 'node_modules\|swagger'
" 
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" if executable('ag')
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif
" 
" 
" 
" " SETUP FOR https://github.com/pangloss/vim-javascript
" let g:javascript_plugin_jsdoc = 1
 


" Common Keybindings
source ~/.config/nvim/common_key_bindings.vim
