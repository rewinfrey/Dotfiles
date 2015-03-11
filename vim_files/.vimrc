"  Maintained by Rick Winfrey "  heavily borrowed from Vincent Driessen's .vimrc file: https://raw.github.com/nvie/vimrc/master/vimrc
"  and http://stevelosh.com/blog/2010/09/coming-home-to-vim/#scratch

set nocompatible
call pathogen#infect()
call pathogen#helptags()
filetype off                    " force reloading *after* pathogen loaded
filetype plugin indent on       " enable detection, plugins and indenting in one step

syntax on
syntax enable
set rtp+=/usr/local/go/misc/vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

" rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" edits behavior
set showmode                       " always show the current Vim mode
set hidden                         " hides buffers rather than closing them
set wildignore=*.swp,*.bak,*.pyc,*.class " ignores these file types

" tabs & indentation
set tabstop=2                      " tabs are 2 spaces
set expandtab                      " use spaces, not tabs (optional)
set smarttab                       " insert tabs on the start of a line according to shiftwidth, not tabstop
set shiftwidth=2                   " number of spaces used by autoindenting
set autoindent                     " default autoindent to on
set copyindent                     " copy previous indentation on autoindenting
set shiftround                     " use multiple of shiftwidth when indenting with '<' and '>'
set cc=90
set winwidth=100

" display
set encoding=utf-8                 " sets default encoding type to UTF-8
set scrolloff=3
set title
set number                         " show line numbers by default
set backspace=indent,eol,start     " backspace through everything in insert mode
set scrolloff=10                   " adds top/bottom buffer between cursor and window
set ruler


" command history / undo
set history=1000                   " because where do we know where we are going, if we do not know where we have been?
set undolevels=1000                " undo a friday night of drunken coding

" alerts
set visualbell
set noerrorbells

" searching
set hlsearch                       " highlight search terms
set incsearch                      " show search matches as you type
set ignorecase                     " ignore case when searching
set smartcase                      " ignore case if search pattern is all lowercase, case-sensitive otherwise
set gdefault                       " search / replace 'globally' (on a line) by default
set showmatch                      " set show matching parenthesis

" line wrapping
set nowrap
set formatoptions=qrn1
" set colorcolumn=100

" don't let Vim backup
set nobackup
set noswapfile
set nowritebackup


" cursor
set cursorline                     " colours the line the cursor is on

" hi CursorLineNR cterm=bold
" augroup CLNRSet
"   autocmd! ColorScheme * hi CursorLineNR cterm=bold
" augroup END

" default colors for CursorLine
" highlight CursorLine ctermbg=Gray ctermfg=Black

" change color of CursorLine when entering insert mode
" autocmd InsertEnter * highlight CursorLine ctermbg=Blue ctermfg=Yellow

" reverts color back to default when leaving insert mode
" autocmd InsertLeave * highlight CursorLine ctermbg=Gray ctermfg=Black
" Change the mapleader from \ to ,
let maplocalleader=","

" hardmode
nnoremap <LocalLeader>h <Esc>:call ToggleHardMode()<CR>

" :command NT NERDTree
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
let g:NERDTreeWinSize = 40
let NERDTreeShowHidden=1

" tabs
set tabline=%!tabber#TabLine()
map <silent> <LocalLeader>ts :tab split<CR>
map <silent> <LocalLeader>tn :TabberLabel<CR>
map <silent> <LocalLeader>tl :TabberShiftLeft<CR>
map <silent> <LocalLeader>tr :TabberShiftRight<CR>
map <silent> <LocalLeader>1  :tabnext 1<CR>
map <silent> <LocalLeader>2  :tabnext 2<CR>
map <silent> <LocalLeader>3  :tabnext 3<CR>
map <silent> <LocalLeader>4  :tabnext 4<CR>
map <silent> <LocalLeader>5  :tabnext 5<CR>
map <silent> <LocalLeader>6  :tabnext 6<CR>
map <silent> <LocalLeader>7  :tabnext 7<CR>

" regenerates ctags
map <silent> <LocalLeader>ct :!ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths) <CR>


" makes regex searches use ruby regex patterns
nnoremap / /\v
vnoremap / /\v

" ,<space> turns off search highlighting
nnoremap <LocalLeader><space> :noh<CR>

" navigate braces with <tab> rather than mother-f'ing hard to type %
nnoremap <tab> %
vnoremap <tab> %

" edit and load vimrc
nmap <silent> <LocalLeader>ev :e $MYVIMRC<CR>
nmap <silent> <LocalLeader>sv :so $MYVIMRC<CR>

nnoremap <leader>i :set list!<CR>

" adds require 'pry'; binding.pry to a line
nmap <LocalLeader>y orequire "pry"<CR>binding.pry<ESC>;

" Airline
""""""""""""""""""""""""""""""
let g:airline_theme               = 'solarized'
let g:airline_enable_branch       = 1
let g:airline_enable_syntastic    = 1
let g:airline_detect_modification = 1
let g:airline_detect_paste        = 1
let g:airline_detect_iminsert     = 1
let g:airline_powerline_fonts     = 1
let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_left_sep          = '🐰 '
"  let g:airline_left_sep = '»'
"  let g:airline_left_sep = '▶'
"  let g:airline_right_sep = '«'
"  let g:airline_right_sep = '◀'
"  let g:airline_symbols.linenr = '␊'
"  let g:airline_symbols.linenr = '␤'
"  let g:airline_symbols.linenr = '¶'
"  let g:airline_symbols.branch = '⎇'
"  let g:airline_symbols.paste = 'ρ'
"  let g:airline_symbols.paste = 'Þ'
"  let g:airline_symbols.paste = '∥'
"  let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_left_sep = '▶'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

:set guifont=Dejavusans:h18

"" filetypes
au  BufRead,BufNewFile *.rabl setfiletype ruby    " .rabl -> ruby

" replaces %/ with current directory, and %% with current file
cmap %/ <C-R>=expand("%:p:h")."/"<CR>
cmap %% <C-R>=expand("%")<CR>

" .vm, from TECS, should be highlighted with assembly
au BufNewFile,BufRead *.vm set filetype=asm
au BufNewFile,BufRead *.jack set filetype=java "not really, but close enough
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-=> <C-w>=

" strip all trailing whitespaces from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Command T settings
let g:CommandTMaxHeight = 20
let g:CommandTMinHeight = 10
let g:CommandTMatchWindowAtTop = 1
let g:CommandTCancelMap='<C-[>'

" NERDTree settings
nnoremap <leader>m :NERDTreeClose<CR> :NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR> :NERDTreeToggle<CR>

" Show hidden files
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Highlight the current file in NT
let NERDTreeHighlightCursorLine=1

" Use a single click to fold/unfold directories and a double clickt open files
let NERDTreeMouseMode=2

" shift-h to move to front of line
nnoremap H 0

" shift-l to move to back of line
nnoremap L $

" run tests
inoremap <leader>w <esc>:write<CR>:!./run_tests.rb %<CR>
nnoremap <leader>w :!./run_tests.rb<CR>

" run clojure tests
nnoremap <leader>t :RunTests<CR>

" connect to repl
nnoremap <leader>c :Connect<CR>

autocmd FileType clojure setlocal lispwords+=describe,it,context

" make racket files appear as scheme
if has ("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

if has ("autocmd")
  au BufReadPost *.hiccup set filetype=clojure
endif

" colorscheme
set t_Co=256
" set background=dark
set background=dark
let g:solarized_visibility = "high"
let g:airline_powerline_fonts=1
let g:airline_theme="solarized"
colorscheme solarized

"" strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" replaces %/ with current directory, and %% with current file
cmap %/ <C-R>=expand("%:p:h")."/"<CR>
cmap %% <C-R>=expand("%")<CR>

" .vm, from TECS, should be highlighted with assembly
au BufNewFile,BufRead *.vm set filetype=asm
au BufNewFile,BufRead *.jack set filetype=java "not really, but close enough
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-=> <C-w>=

" strip all trailing whitespaces from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Control P settings
nmap <silent> <LocalLeader>p :CtrlP<CR>
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_open_new_file = 'v'

" Control P Tags
nnoremap <localleader>. :CtrlPTag<cr>

" NERDTree settings
nnoremap <leader>m :NERDTreeClose<CR> :NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR> :NERDTreeToggle<CR>

" Show hidden files
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Highlight the current file in NT
let NERDTreeHighlightCursorLine=1

" Use a single click to fold/unfold directories and a double clickt open files
let NERDTreeMouseMode=2

" shift-h to move to front of line
nnoremap H 0

" shift-l to move to back of line
nnoremap L $

" run tests
inoremap <leader>w <esc>:write<CR>:!./run_tests.rb %<CR>
nnoremap <leader>w :!./run_tests.rb<CR>

autocmd FileType clojure setlocal lispwords+=describe,it,context

" make racket files appear as scheme
if has ("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

" key mappings for running tests
map <LocalLeader>r :call RunTestFile()<cr>
map <LocalLeader>R :call RunNearestTest()<cr>
map <LocalLeader>a :call RunTests('')<cr>
map <LocalLeader>c :w\|:!script/features<cr>
map <LocalLeader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color -f d " . a:filename
        else
            exec ":!rspec --color -f d " . a:filename
        end
    end
endfunction

function! FindSpec()
  let l:cwd=getcwd()
  let l:file_path=expand("%:p")
  let l:split_path=split(l:file_path, "/")

  " For this gem, we don't need lib/dd-core, remove them
  call remove(l:split_path, l:project_index+1, l:project_index+2)

  " Inject the spec dir
  call insert(l:split_path, "spec", l:project_index+1)

  let l:file_name = l:split_path[len(l:split_path)-1]
  let l:spec_file_name = strpart(l:file_name, 0, strlen(l:file_name)-3)."_spec.rb"

  "replace the file name with the spec file name
  let l:split_path[len(l:split_path)-1] = l:spec_file_name

  let l:spec_file_path = join(l:split_path, "/")

  echo l:spec_file_path
  execute ":vsplit /".l:spec_file_path
endfunction

" Attila's find spec
nmap ,a :call FindSpec()<CR>
