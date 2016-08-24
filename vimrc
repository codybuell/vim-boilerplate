""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
" VIM Starter Configuration File                                               "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"//////////////////////////////////////"
"//                                  //"
"//  Pathogen / Third Party Plugins  //"
"//                                  //"
"//////////////////////////////////////"

" load pathogen from bundle directory rather than autoload
runtime bundle/vim-pathogen/autoload/pathogen.vim

" define pathogen runtime roots
execute pathogen#infect('bundle/{}')

" always execute loading of help files
Helptags

"////////////////////////"
"//                    //"
"//  General Settings  //"
"//                    //"
"////////////////////////"

" turn on syntax highlighting
syntax on

" set config options
set nocompatible                                   " disable compatability mode
set incsearch                                      " search as chars are entered
set hlsearch                                       " highlight search results
set history=100                                    " keep 100 lines of history
set ruler                                          " show the cursor position
set sts=2                                          " sets the soft tab stop
set ts=2                                           " tab stop to 4 spaces
set sw=2                                           " shift width, auto ind / shifting spaces
set shiftround                                     " always indent by multiple of shiftwidth
set ai                                             " auto indenting
set et                                             " expand tabs to spaces
set scrolloff=4                                    " scroll before end of page
set enc=utf-8                                      " default to utf-8 encoding
set visualbell                                     " stop beeps and alerts
set noerrorbells                                   " stop beeps and alerts
set t_vb=                                          " stop beeps and alerts
set nu                                             " turn on line numbers
set rnu                                            " turn on relative line numbers
set cursorline                                     " highight line cursor is on
set wildmenu                                       " improved file open menu
set lazyredraw                                     " no redraw during macros etc
set list                                           " show special characters
set lcs=eol:¬,tab:>-,trail:.,extends:»,precedes:«  " special character labels
set backspace=2                                    " make bkspace work on line br & auto indents
set complete=.,w,b,u                               " auto complete from current file, window, buffers
set ignorecase                                     " case insensitive searching
set smartcase                                      " except when there is an uc char in search
set nofoldenable                                   " open files without folding
set foldmethod=syntax                              " enable folding by syntax
set foldlevel=1                                    " fold second level and greater
set laststatus=2                                   " enable statusline
set highlight+=N:DiffText                          " make current line number stand out a little

" custom line break symbol
if has('linebreak')
  let &showbreak='⤷ '
endif

"///////////////////////"
"//                   //"
"//  Global Settings  //"
"//                   //"
"///////////////////////"

" set config options
setglobal rnu                                      " turn on relative line numbers

"//////////////"
"//          //"
"//  Colors  //"
"//          //"
"//////////////"

let g:base16colorspace=256
set background=dark
colo xoria256
