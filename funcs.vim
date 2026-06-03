" "Lets you do cross platform .vimrc settings
"if has('mac')
"  "Back up files to ~/.vim/backup
"  set backup
"  set backupdir=~/.vim/backup
"
"  " Author:  Benji Fisher <benji@member.AMS.org>
"  " Last modified:  8 May 2006
"  " TODO:  Is there a better way to tell that Vim.app was started from Finder.app?
"  " Note:  Do not move this to the gvimrc file, else this value of $PATH will
"  " not be available to plugin scripts.
"  if has("gui_running") && system('ps xw | grep "Vim -psn" | grep -vc grep') > 0
"    " Get the value of $PATH from a login shell.
"    " If your shell is not on this list, it may be just because we have not
"    " tested it.  Try adding it to the list and see if it works.  If so,
"    " please post a note to the vim-mac list!
"    if $SHELL =~ '/\(sh\|csh\|bash\|tcsh\|zsh\)$'
"      let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
"      let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
"    endif
"  endif
"elseif has('win32')
"  "Back up files to ~/.vim/backup
"  set backup
"  silent execute '!mkdir "'.$HOME.'/backup"'
"  set backupdir=$HOME/backup
"elseif has ('unix')
"  "Back up files to ~/.vim/backup
"  set backup
"  set backupdir=~/.vim/backup
"endif
 
 
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
 autocmd BufWrite *.py :call DeleteTrailingWS()
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

 func! FullPathToCopyBuffer()
   let @+ = expand('%:p')
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
