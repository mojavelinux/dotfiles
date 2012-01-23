" Filename: .vimrc
" Maintainer:  Dan Allen <dan.allen@mojavelinux.com>

" NOTES:
" set digraph " default for nocompatible, will let you enter special characters

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible        " This must be first, because it changes other options as a side effect
set sc                  " Show partial command in lower-right corner
set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
set nobackup            " do not keep a backup file, use versions instead
set bdir=~/.vim,~/tmp   " directory where the backup file is temporarily stored
set viminfo='20,\"50    " read/write a .viminfo file, don't store > 50 lines
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set incsearch           " do incremental searching
"set hidden             " allows changes to be made and unmade to files that have been quit
set et                  " expands tabs to spaces
set sw=3                " number of spaces to use for each step of indent
set ts=3                " number of columns a tab will span
set background=dark     " setup colors for a dark background
set modeline            " allow commands from file to be executed
set wildmenu            " tab expansion leads to an inline menu of possible selections
set foldmethod=marker   " allow vim folds
set scrolloff=5         " vertical padding from cursor to edge of screen
set scroll=1            " number of lines to scroll prior to cursor hitting end of document
"set mouse=a            " Allow use of the mouse (SHIFT required to perform text selection)
set path=.,~
let g:netrw_silent=1
"set lazyredraw

" === Special key mappings

" Make shift-insert work like in Xterm
" note that in KDE, you must have klipper the option set:
"     - Synchronize the contents of the clipboard and the selection
" for this to work
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

map <F10> :set paste<CR>i
map <F11> :set nopaste<CR>

" Bubble single lines
nmap <A-Up> ddkP
nmap <A-Down> ddp
" Bubble multiple lines
"vmap <A-Up> xkP`[V`]
"vmap <A-Down> xp`[V`]

map + <C-A>
map - <C-X>

" Don't use Ex mode, use Q for formatting
map Q gq

" check for color enabled terminal or gui
if &t_Co > 2 || has("gui_running")
  syntax on                " turn on syntax highlighting
  set hlsearch             " highlight the search pattern
endif

if &diff
  set background=dark
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " don't use the indent plugin
  filetype plugin indent off

  au BufNewFile,BufRead *.txt setf text

  " For all text files set 'textwidth' to 78 characters.
  au FileType text setlocal tw=0 linebreak "columns=120

  " For all html files set 'tabstop' to 2 characters.
  au FileType html setlocal ts=2
  au BufRead,BufNewFile *.jspx setlocal ts=2 sw=2
  au BufRead *.jsp setlocal foldmarker=<%--,--%>
  au BufRead *.java setlocal foldmarker=/*\ ,*/

  " Project-specific settings
"  au BufRead,BufNewFile */mojarra-trunk*/* set et 
"  au BufRead,BufNewFile */seam-*/* set et ts=3 sw=3
"  au BufRead,BufNewFile */webbeans-*/* set et ts=3 sw=3
"  au BufRead,BufNewFile */weld-*/* set et ts=3 sw=3

  "au Filetype html,xml,xhtml,xsl source ~/.vim/scripts/closetag.vim 

  " change current directory to that of the file
  au BufEnter * :silent! cd %:p:h

  " use template for new files based on type (always leaves a blank line at bottom)
  au BufNewFile *.html 0r ~/.vim/skel.html
  au BufNewFile *.xhtml 0r ~/.vim/skel.xhtml
  au BufNewFile *.java 0r ~/.vim/skel.java
  au BufNewFile *.page.xml 0r ~/.vim/skel.page.xml
  au BufNewFile pom.xml 0r ~/.vim/skel.pom.xml

  " When editing a file, jump to the last cursor position (messes up svn commit)
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

"  syn region faceletsRemove start=/<ui:remove>/ end=/<\/ui:remove>/
"  command -nargs=+ HiLink hi def link <args>
"  HiLink faceletsRemove htmlComment
"  delcommand HiLink

endif

"if &term=="xterm"
"     set t_Co=8
"     set t_Sb=[4%dm
"     set t_Sf=[3%dm
"endif
