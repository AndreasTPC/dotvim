" TPC's vimrc v1.5

" disable vi-compatibility mode
set nocompatible

" load vim plugins that use pathogen (plugins in the ~/.vim/bundle dir)
call pathogen#infect()

" syntax highlight settings
filetype plugin on  " load syntax parsing/highlighting rules specific to the file type we're editing
set t_Co=256        " indicate that our terminal supports 256 colors (rather than 16)
set background=dark " indicate that vim should pick colors that look good against on dark backgrounds
color desert256v2   " select what color scheme to use
syntax enable       " enable syntax highlighting
hi ColorColumn ctermfg=NONE ctermbg=24 cterm=NONE

" indentation settings
filetype indent on " load indentation rules specific to the file type we're editing
set autoindent     " copy indent level of previous line when making a new line
set smartindent    " automatically go up and down an indentation level where appropiate, for example in c a single } goes down a level
set expandtab      " expand tabs to spaces
set tabstop=4      " how wide a tab character is visually
set softtabstop=4  " how wide a tab character is when editing
set shiftwidth=4   " number of spaces to use per indent level when autoindenting

" user interface settings
set guioptions-=T                              " disable toolbars in gvim
set number                                     " add a column with line numbers on the left side of the screen
set wildmenu                                   " show a small menu when tab-completing a filename
set wildignore=*.o,*~                          " files that shouldn't show up in the menu
set showmatch                                  " when closing a bracket or pharantesis highlight the corresponding opening bracket/pharantesis for a short time
set matchtime=3                                " how long showmatch will highlight corresponding pharantesis (in tenths of a second)
let loaded_matchparen=1                        " disable always highlighting matching pharantesis when hovering over the other one (I think its distracting)
set ruler                                      " show current row and column in the status bar
set lazyredraw                                 " don't redraw the screen while doing certain tasks, can boost performance slightly
set novisualbell                               " use audible bells instead of visual
set noerrorbells                               " don't use bells to indicate errors
set list                                       " display some nonprintable characters
set listchars=tab:.\ ,trail:-                  " select what nonprintable characters to display: tabs becomes a dot and then fills in with spaces, whitespace at the end of a line becomes dashes
set fillchars="stl:\ ,stlnc:\ ,vert:|,fold:\ " " characters to use when filling various spaces

" text encoding settings
set encoding=utf8                     " the encoding of our terminal
set fileencoding=utf8                 " what encoding to use when saving files
set fileencodings=utf8,latin1,ucs-bom " what encodings to try to use when reading files (in specified order)

" search settings
set incsearch  " enable incremental search (search as you type)
set nohlsearch " disable highlighting all search matches (I find it distracting)
set ignorecase " disable case-sensitivy when searching
set smartcase  " re-enable case-sensitivy if the search term contains uppercase characters

" show a marker after 75 columns to help avoiding long lines
"set textwidth=75
"set colorcolumn=+1

" folding settings
"set foldenable             " enable folding
"set foldmethod=indent      " use line indentation to find blocks to FOLD
"set foldlevelstart=0       " lowest indentation level to start folding at
"set foldopen=""            " disable all automatic fold opening (I prefer to do it with key bindings)
"set foldclose=""           " disable all automatic fold closing (I prefer to do it with key bindings)
"set foldminlines=1         " do not fold if the fold is only 1 line long
"set foldtext=GetFoldText() " use below function to label the fold
function! GetFoldText()    " this will create an indented label for the fold, looking like this: [+] (x lines)
    let n = v:foldend - v:foldstart + 1
    let indent_level = indent(v:foldstart)
    let indent = repeat(' ',indent_level)
    return indent . "[+] (" . n . " lines)"
endfunction

" backup settings
set writebackup      " when writing write to a copy, then copy to original file, then delete copy
set backupdir=/tmp   " where to put backup files
set directory=/tmp   " where to put swap files

" plugin settings
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz1234567890' " keys that easymotion will use
let g:EasyMotion_do_shade=0                                    " disable shading when using easymotion

" misc settings
set magic " enable extended regular expressions
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif " when opening a file jump to last line you were on

" keyboard settings
set backspace=indent,eol,start " makes backspace/delete/etc keys allowed to delete line breaks and automatically inserted indentation
set whichwrap=<,>              " makes left/right arrow keys move cursor to previous/next line when at the begging/end of a line (in normal mode, add [ and ] to the list to allow in insert mode)

" key bindings

" make ctrl+n and ctrl+p switch to next/previous buffer
nnoremap <C-n> <C-W>w
nnoremap <C-p> <C-W>W
" make + and - keys show and hide folds
nnoremap + zo
nnoremap - zc
" mappings for easymotion plugin
let g:EasyMotion_mapping_s = 'f'

" autorplace words as you type
iabbrev teh the
