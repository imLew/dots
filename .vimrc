colorscheme zenburn

" turn on line numbers
set number


" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27


" only do this part when compiled with support for autocommands.
" Use filetype detection and file-based automatic indenting.
filetype plugin indent on
if has("autocmd")

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif
"au BufNewFile,BufRead *.py
" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
set textwidth=79
" color past column 80 - ruler
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" set autoindent

"au BufNewFile,BufRead *.js, *.html, *.css, *.yml, *.md
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2

 set encoding=utf-8

" my keybinds
" switch tabs with F7/F8
imap <F7> <Esc>:tabp<Return>
imap <F8> <Esc>:tabn<Return>
nmap <F7> :tabp<Return>
nmap <F8> :tabn<Return>

" add newline without entering insert mode
nnoremap o o<Esc>
nnoremap O O<Esc>

" remap pane/window navigation
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

" Enable folding with the spacebar
nnoremap <space> za
vnoremap <space> za


"" Tab completion

" autocomplete suggestions
" :set completeopt=longest,menuone

" plugins (vim native manager)
packadd SimpylFold
"let g:SimpylFold_docstring_preview=1
packadd FastFold
let g:fastfold_savehook = 0
packadd vim-stay
set viewoptions=cursor,folds,slash,unix

packadd YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <S-Tab>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

packadd syntastic
let python_highlight_all=1
" syntax on


"" will insert tab at beginning of line,
"" will use completion if not at beginning
"set wildmode=list:longest,list:full
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <S-Tab> <c-n>


""""" Pathogen plugin stuff
" launch pathogen
" execute pathogen#infect()

"" syntastic
"
"let g:syntastic_python_checkers = ['pyflakes']
"
"let g:syntastic_check_on_open=0
"let g:syntastic_enable_signs=0
