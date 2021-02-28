" Filename: .vimrc
" Maintainer:  Dan Allen <dan.j.allen@gmail.com>

" NOTES:
" set digraph " default for nocompatible, will let you enter special characters
" trailing ! on set value toggles value (not disable)

" TIPS:
" See http://yoursachet.com for a custom vimrc wizard
" On Mac keyboard, Fn+Return is <CR>, can use it to select directory in wildmenu
" On Mac keyboard, Fn+<F2> to toggle paste in insert mode; On PC keyboard, Fn+delete to toggle paste in insert mode
" set list to show the no-visible characters and marks
" :messages to show the error messages that fly by, or type g<
" :g/regex/# show lines that contain match in a list
" :set virtualedit=all lets you position the cursor anywhere
" Use <Control-Shift-v> to insert from clipboard (leverages Gnome Terminal functionality)
" vitc on XML tag to enter insert mode to replace content
" vat!xmlencode on XML tag to encode entities
" gd goes to the definition of a variable
" diw deletes current word, but leaves a space to type a new word
" ciw does that, but leaves you in insert mode
" <Control>r= in insert mode provides a calculator
" prefix "_ with a normal-mode edit operation to avoid overwriting the default register
" ]m takes you forward to the next start of method, [m in the opposite direction

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=utf-8,latin1
endif

set nocompatible        " This must be first, because it changes other options as a side effect
set nojoinspaces        " Don't double space paragraphs when wrapping.
set viminfo='100,<50,s10,h,n~/.vim/.viminfo
set history=50          " keep 50 lines of command line history
set dir=~/.vim/tmp//    " directory where the swap file is stored (trailing double slash enables full-qualified file name)
"set bdir=~/.vim/tmp     " directory where the backup file is temporarily stored (I don't use backup files)
set nobackup            " do not keep a backup file, use versions instead
"set nofixeol            " do not add an endline to the end of the file
set sc                  " Show partial command in lower-right corner
set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
set ruler               " show the cursor position all the time
"set number             " always show line numbers
"set relativenumber     " shows line numbers in relative distance from current line (mutually exclusive w/ number)
set incsearch           " do incremental searching
"set hidden             " allows changes to be made and unmade to files that have been quit
set et                  " expands tabs to spaces
set sw=4                " number of spaces to use for each step of indent
set ts=4                " number of columns a tab will span
set modeline            " allow commands from file to be executed
set wildmenu            " tab expansion leads to an inline menu of possible selections
set virtualedit=block,insert
set foldmethod=marker   " allow vim folds
set scrolloff=5         " vertical padding from cursor to edge of screen
set scroll=1            " number of lines to scroll prior to cursor hitting end of document
set mouse=a            " Allow use of the mouse (SHIFT required to perform text selection)
set dict=/usr/share/dict/words " Setup a dictionary for word completion using <Ctrl-x><Ctrl-k> in insert mode
set path=.,~
set listchars=nbsp:¤,eol:$
let g:netrw_silent=1
"set lazyredraw
let mapleader="\\"
let maplocalleader="\\"
let g:ruby_path=system('which --skip-tilde ruby')  " force Vim to use system Ruby even when `which ruby` resolves to JRuby

" plugins managed by plug (see https://github.com/junegunn/vim-plug#usage)
call plug#begin()
Plug 'slim-template/vim-slim' " support for slim-lang files
Plug 'mustache/vim-mustache-handlebars' " support for mustache and handlebars files
Plug 'adelarsq/vim-matchit' " advanced % matching
Plug 'junegunn/goyo.vim' " distraction-free writing
Plug 'majutsushi/tagbar' " ctags sidebar
Plug 'digitaltoad/vim-pug' " support for pug template files
Plug 'tpope/vim-commentary' " comment stuff out using gc
Plug 'mojavelinux/vim-voom-plugin', { 'branch': 'improved' } " outline mode
call plug#end()

"let g:goyo_width=100
map <Leader>f :Goyo <bar> highlight StatusLineNC ctermfg=white<CR>

"show man page in split
let $GROFF_NO_SGR=1
source $VIMRUNTIME/ftplugin/man.vim
nmap K :Man <cword><CR>

" === Special key mappings

"inoremap <Leader><Leader> <Leader>
imap <Leader>da Dan Allen
imap <Leader>sw Sarah White
imap <Leader>arq Arquillian
imap <Leader>adr Asciidoctor
imap <Leader>ad AsciiDoc

" jump between brackets using tab
nnoremap <Tab> %

" Make shift-insert work like in Xterm
" note that in KDE, you must have klipper the option set:
"     - Synchronize the contents of the clipboard and the selection
" for this to work
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"set pastetoggle=<F2>
set pastetoggle=<Insert>
"map <F10> :set paste<CR>i
"map <F11> :set nopaste<CR>

" Bubble single lines
nmap <A-Up> ddkP
nmap <A-Down> ddp
"execute "set <A-k>=\ek"
"execute "set <A-j>=\ej"
"nnoremap <A-k> ddkP
"nnoremap <A-j> ddp

" Bubble multiple lines
"vmap <A-Up> xkP`[V`]
"vmap <A-Down> xp`[V`]

" toggle line numbers; lined are numbered relative to the current line
nnoremap <Leader><C-N> :set relativenumber!<CR>

map + <C-A>
map - <C-X>

" start insert mode below second line
"nnoremap U j<C-o>o<CR>
" advance character to right and insert space
"nnoremap <C-I> a<Space>

" insert blank line below current line
nnoremap <C-J> m`o<Esc>``
" insert blank line above current line
nnoremap <C-K> m`O<Esc>``

" Don't use Ex mode, use Q for formatting
map Q gq

" make a man out of Man
"cnoreabbrev man Man

" navigate files
map gf :e <cfile><CR> :argadd %<CR>
map gl :argdelete %<CR> :last<CR>
map gL :Explore<CR>

" tagbar config
let g:tagbar_sort=0
let g:tagbar_compact=1
nnoremap <silent> <F9> :TagbarToggle<CR>
"nnoremap <silent> <Leader>] :TagbarToggle<CR>
"" TODO use custom ctags file so doesn't conflict with other uses of ctags
""let g:tagbar_type_asciidoc = {
""  \ 'ctagstype' : 'asciidoc',
""  \ 'kinds' : [
""    \ 's:Table of Contents',
""  \ ],
""  \ 'sort' : 0,
""\ }
""  "\ 'sro' : '',
""  "\ 'kind2scope' : {
""  "  \ 's' : 'section'
""  "\ },
""  "\ 'scope2kind' : {
""  "  \ 'section' : 's'
""  "\ },
"let g:tagbar_width=42

" voom config
let g:voom_default_mode="asciidoc"
let g:voom_tree_placement="right"
let g:voom_tree_width=42
nnoremap <Leader>v :VoomToggle<CR>

" NERDTree config
"nnoremap <Leader>f :NERDTree<CR>

" check for color enabled terminal or gui
if &t_Co > 2 || has("gui_running")
  syntax on                " turn on syntax highlighting
  set hlsearch             " highlight the search pattern
  nnoremap <Leader><C-[> :nohls<CR>

  " use these if using a dark terminal theme
  "hi Search ctermfg=0 ctermbg=4
  "hi DiffChange ctermbg=16
  "hi DiffDelete ctermbg=5
  "hi DiffAdd ctermbg=54
  "hi DiffText cterm=NONE ctermbg=12
  "hi Folded ctermfg=White ctermbg=240
  "hi FoldColumn ctermfg=White ctermbg=244
endif

if &diff
  syntax off
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  "au vimenter * if !argc() | NERDTree | endif
  "au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  " don't use the indent plugin
  filetype indent off

  augroup noincsearch_when_substituting
    au!
    au CmdlineEnter : :set noincsearch
    au CmdlineLeave : :set incsearch
  augroup END

  au BufNewFile,BufRead *.txt setf text

  au BufReadCmd *.gem call tar#Browse(expand("<amatch>"))
  "au BufReadCmd *.epub,*.jar,*.xpi call zip#Browse(expand("<amatch>"))
  au BufReadCmd *.epub,*.xpi call zip#Browse(expand("<amatch>"))

  " For all text files set 'textwidth' to 78 characters.
  au FileType text setlocal tw=0 linebreak "columns=120

  " For all html files set 'tabstop' to 2 characters.
  au FileType ruby setlocal ts=2 sw=2
  au FileType html setlocal ts=2 sw=2
  au FileType xml setlocal ep=xmllint\ --format\ -
  au BufRead,BufNewFile *.jspx setlocal ts=2 sw=2
  au BufRead *.jsp setlocal foldmarker=<%--,--%>
  au BufRead *.java setlocal foldmarker=/*\ ,*/
  au BufRead *.hbs setlocal nofen syntax=html
  au BufRead,BufNewFile *.opalerb setlocal filetype=eruby
  "au BufRead,BufNewFile *.{asc{,iidoc},ad{,oc}} setlocal filetype=asciidoc linebreak showbreak=>\|
  au BufRead,BufNewFile *.{asc{,iidoc},ad{,oc}} setlocal filetype=asciidoc linebreak showbreak=↳\ 
  au BufNewFile,BufRead *.json.hbs set filetype=handlebars

  au FileType asciidoc setlocal spell spelllang=en_us spell! commentstring=//\ %s

  au FileType asciidoc
  \ hi Macro ctermfg=DarkRed |
  \ imap <buffer> <Leader>h1 = |
  \ imap <buffer> <Leader>h2 == |
  \ imap <buffer> <Leader>h3 === |
  \ imap <buffer> <Leader>h4 ==== |
  \ imap <buffer> <Leader>h5 ===== |
  "\ imap "" ``''<Left><Left>|
  "\ imap ** **<Left>|
  "\ let b:match_words = '^==* \S.*$:\n==* \S.*'

  " TODO create alias for inserting a date
  " :r !date +\%Y-\%m-\%d

  " wrap phrase in block: ,Q<text><C-o>U<text> (where <text> is any text)
  " wrap phrase in emphasis: ,'<text><C-o>a<text> (where <text> is any text)
  " wrap phrase in bold: ,*<text><C-o>a<text> (where <text> is any text)
  " advance to next paragraph: ,<Enter>
  " FIXME comment is funky because we get extra characters after <C-o>U
  " NOTE the remapping of [ is tricky
  "\ imap <buffer> <C-]> <C-o>B<C-o>E<Right><Space>|
  "\ imap <buffer> <C-i> <C-o>$<CR><CR>|
  "\ imap <buffer> <C-j> <Down><C-o>o<CR>|
  "\ imap <buffer> <Leader>h1 = |
  "\ imap <buffer> <Leader>h2 == |
  "\ imap <buffer> <Leader>h3 === |
  "\ imap <buffer> <Leader>h4 ==== |
  "\ imap <buffer> <Leader>h5 ===== |
  "\ imap <buffer> <Leader>qb ____<CR>____<Esc>O|
  "\ imap <buffer> <Leader>eb ====<CR>====<Esc>O|
  "\ imap <buffer> <Leader>cb ----<CR>----<Esc>O|
  "\ imap <buffer> <Leader>lb ....<C-o>o....<C-o>O|
  "\ imap <buffer> <Leader>pb ++++<CR>++++<Esc>O|
  "\ imap <buffer> <Leader>sb ****<CR>****<Esc>O|
  "\ imap <buffer> <Leader>/b ////<C-o>o<C-o>0<C-o>d$////<C-o>O<C-o>0<C-o>d$|
  "\ nmap <buffer> <Leader>qb 0O____<C-o>0<Down><C-o>o____<Up><Esc>$|
  "\ nmap <buffer> <Leader>eb 0O====<C-o>0<Down><C-o>o====<Up><Esc>$|
  "\ nmap <buffer> <Leader>cb 0O----<C-o>0<Down><C-o>o----<Up><Esc>$|
  "\ nmap <buffer> <Leader>lb 0O....<C-o>0<Down><C-o>o....<Up><Esc>$|
  "\ nmap <buffer> <Leader>pb 0O++++<C-o>0<Down><C-o>o++++<Up><Esc>$|
  "\ nmap <buffer> <Leader>sb 0O****<C-o>0<Down><C-o>o****<Up><Esc>$|
  "\ nmap <buffer> <Leader>/b 0O////<C-o>0<Down><C-o>o////<Up><Esc>$|
  "\ nmap <buffer> <Leader>// gI// <Esc>$|
  "\ imap <buffer> <Leader>r '''<CR><CR>|
  "\ imap <buffer> <Leader>n. NOTE: |
  "\ imap <buffer> <Leader>nb <Leader>[NOTE<C-o>o<Leader>eb|
  "\ imap <buffer> <Leader>t. TIP: |
  "\ imap <buffer> <Leader>tb <Leader>[TIP<C-o>o<Leader>eb|
  "\ imap <buffer> <Leader>!. IMPORTANT: |
  "\ imap <buffer> <Leader>!b <Leader>[IMPORTANT<C-o>o<Leader>eb|
  "\ imap <buffer> <Leader>w. WARNING: |
  "\ imap <buffer> <Leader>wb <Leader>[WARNING<C-o>o<Leader>eb|
  "\ imap <buffer> <Leader>$. CAUTION: |
  "\ imap <buffer> <Leader>$b <Leader>[CAUTION<C-o>o<Leader>eb|
  "\ imap <buffer> <Leader>i. image:<Leader>[<Left>|
  "\ imap <buffer> <Leader>ib image::<Leader>[<Left>|
  "\ imap <buffer> <Leader>l. link:<Leader>[<Left>|
  "\ imap <buffer> <Leader>* **<Left>|
  "\ imap <buffer> <Leader>' ''<Left>|
  "\ imap <buffer> <Leader>" ""<Left>|
  "\ imap <buffer> <Leader>` ``<Left>|
  "\ imap <buffer> <Leader>p' `'<Left>|
  "\ imap <buffer> <Leader>p" ``''<Left><Left>|
  "\ imap <buffer> <Leader>+ ++++++<Left><Left><Left>|
  "\ imap <buffer> <Leader>< <><Left>|
  "\ imap <buffer> <Leader>: ::<Left>|
  "\ imap <buffer> <Leader>[ []<Left>|
  "\ imap <buffer> <Leader>( (())<Left><Left>|
  "\ nmap <buffer> <Leader>q* hEa<Space><Esc><Left>ciW*<C-o>P*<Esc>lx|
  "\ nmap <buffer> <Leader>q' hEa<Space><Esc>BviW:s/\%V'\%V/\\'/ge<CR>:nohls<CR>gv<C-c>viWc'<C-o>P'<Esc>lx|
  "\ nmap <buffer> <Leader>q" hEa<Space><Esc><Left>ciW"<C-o>P"<Esc>lx|
  "\ nmap <buffer> <Leader>q` hEa<Space><Esc><Left>ciW`<C-o>P`<Esc>lx|
  "\ nmap <buffer> <Leader>q+ hEa<Space><Esc><Left>ciW+++<C-o>P+++<Esc>lx|
  "\ imap <C-l>s *<Space>|
  "\ imap <C-l>n <Esc>?^*<CR>:nohls<CR>yt<Space><C-O>o<C-O>d0<C-O>p<Space>|
  "\ imap <C-l>e <C-o>o<Space><C-o>d0|
  "\ imap <C-l>> <Esc>?^*:nohls<CR><CR>yt<Space><C-O>o<C-O>d0<C-O>p*<Space>|
  "\ imap <C-l>< <Esc>?^*:nohls<CR><CR>yt<Space><C-O>o<C-O>d0<C-O>p<BS><Space>|
  "\ imap <C-l><Tab> <BS>*<Space>|
  "\ imap <C-l><S-Tab> <BS><BS><Space>|
  "\ imap "" ``''<ESC>hi
  "\ map "" i""

  "\ nmap <buffer> <Leader>x` hEa<Space><Esc><Left>ciW`<<C-o>P>`<Esc>lx|
  "\ nmap <buffer> <Leader>x hEa<Space><Esc><Left>ciW<<C-o>P><Esc>lx|
  "\ imap <buffer> <Leader><Enter> <C-o>$<CR><CR>|

  au BufRead,BufNewFile *.appl setfiletype yaml
  au BufRead,BufNewFile Jenkinsfile setfiletype groovy

  " Project-specific settings
  "au BufRead,BufNewFile */arquillian/* set et ts=3 sw=3
  "au BufRead,BufNewFile */mojarra-trunk*/* set et
  "au BufRead,BufNewFile */seam-*/* set et ts=4 sw=3

  "au Filetype html,xml,xhtml,xsl source ~/.vim/scripts/closetag.vim

  " change current directory to that of the file (can return using :cd -)
  au BufEnter * :silent! lcd %:p:h

  " disable that annoying continuation of comment on append/prepend line
  au BufReadPost,BufNewFile * set fo=crqljn

  " use template for new files based on type (always leaves a blank line at bottom)
  "au BufNewFile *.html 0r ~/.vim/skel.html
  "au BufNewFile *.xhtml 0r ~/.vim/skel.xhtml
  "au BufNewFile *.svg 0r ~/.vim/skel.svg
  "au BufNewFile *.java 0r ~/.vim/skel.java
  "au BufNewFile *.page.xml 0r ~/.vim/skel.page.xml
  "au BufNewFile pom.xml 0r ~/.vim/skel.pom.xml

  " When editing a file, jump to the last cursor position
  au BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

endif
