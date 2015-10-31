set nocompatible
call pathogen#infect()
call pathogen#helptags()

filetype off                    " force reloading *after* pathogen loaded
filetype plugin indent on       " enable detection, plugins and indenting in one step
syntax on
syntax enable
set rtp+=/usr/local/go/misc/vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

" disable Ex mode
nnoremap Q <nop>

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
set winwidth=100

" display
set encoding=utf-8                 " sets default encoding type to UTF-8
set scrolloff=3
set title
set number                         " show line numbers by default
set backspace=indent,eol,start     " backspace through everything in insert mode
set scrolloff=10                   " adds top/bottom buffer between cursor and window
set ruler

" colorscheme
set t_Co=256
set background=dark
let base16colorspace=256
let g:solarized_visibility = "high"
let g:airline_powerline_fonts=1
let g:airline_theme="dark"
"colorscheme atom
colorscheme base16-default

" Airline
let g:airline_theme               = 'base16'
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

" cursorLine
set cursorline
hi cursorline cterm=none ctermbg=none ctermfg=none
hi cursorlinenr ctermfg=yellow

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

" don't let Vim backup
set nobackup
set noswapfile
set nowritebackup

let maplocalleader=","

" :command NT NERDTree
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
let g:NERDTreeWinSize = 20
let NERDTreeShowHidden=1 " Show hidden files
let NERDTreeShowFiles=1

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

" makes regex searches use ruby regex patterns
nnoremap / /\v
vnoremap / /\v

" ,<space> turns off search highlighting
nnoremap <LocalLeader><space> :noh<CR>

" navigate braces with <tab> rather than %
nnoremap <tab> %
vnoremap <tab> %

" adds require 'pry'; binding.pry to a line
nmap <LocalLeader>y orequire "pry"<CR>binding.pry<ESC>;

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" CtrlP
nmap <silent> <LocalLeader>p :CtrlP<CR>
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_open_new_file = 'v'
nnoremap <localleader>. :CtrlPTag<cr>

" Copy to clipboard
nnoremap <localleader>y :w !pbcopy<CR><CR>

" Clojure
" rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['blue',           '#FF6000'],
    \ ['darkgreen',      '#00FF00'],
    \ ['red',            '#FF0000'],
    \ ['White',          '#c0c0c0'],
    \ ['cyan',           '#00FFFF'],
    \ ['darkmagenta',    '#CC00FF'],
    \ ['yellow',         '#FFFF00'],
    \ ['blue',           '#FF6000'],
    \ ['darkgreen',      '#00FF00'],
    \ ['red',            '#FF0000'],
    \ ['White',          '#c0c0c0'],
    \ ['cyan',           '#00FFFF'],
    \ ['darkmagenta',    '#CC00FF'],
    \ ['yellow',         '#FFFF00'],
    \ ['blue',           '#FF6000'],
    \ ['darkgreen',      '#00FF00'],
    \ ['red',            '#FF0000'],
    \ ['White',          '#c0c0c0'],
    \ ['cyan',           '#00FFFF'],
    \ ['darkmagenta',    '#CC00FF'],
    \ ['yellow',         '#FFFF00']
    \ ]

let g:rbpt_max = 21
let g:rbpt_loadcmd_toggle = 0
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defcustom"],
    \ 'clojureFunc': ["string/join", "string/replace"]
    \ }

" automatically connect to a repl
let g:salve_auto_start_repl = 0

" syntax highlighting for speclj
autocmd FileType clojure setlocal lispwords+=describe,it,context

" run clojure tests
nmap <silent> <LocalLeader>d :Dispatch<CR>

" alternate between test and source file
nmap <silent> <LocalLeader>a :AV<CR>

" start a repl with the current namespace
nmap <silent> <LocalLeader>z :Console<CR>

" Racket (Scheme)
" make racket files appear as scheme
if has ("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

if has ("autocmd")
  au BufReadPost *.hiccup set filetype=clojure
endif

" Vim functions
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

" automatically call StripTrailingWhitespaces() when buffer is saved
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

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

" key mappings for running tests
map <LocalLeader>r :call RunTestFile()<cr>
map <LocalLeader>R :call RunNearestTest()<cr>

" Autoload vimrc while editing vimrc
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
