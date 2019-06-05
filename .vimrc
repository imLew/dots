colorscheme escuro

" turn on line numbers
set number relativenumber

filetype plugin indent on

"By default use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
set textwidth=80

if has("autocmd")
    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab
    
    " highlight during search but not after
    set is
    augroup vimrc-incsearch-highlight
      autocmd!
      autocmd CmdlineEnter /,\? :set hlsearch
      autocmd CmdlineLeave /,\? :set nohlsearch
    augroup END
endif

" color past column 80 - ruler
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

set autoindent

" my keybinds
" switch tabs with F7/F8
imap <F7> <Esc>:tabp<Return>
imap <F8> <Esc>:tabn<Return>
nmap <F7> :tabp<Return>
nmap <F8> :tabn<Return>
" vim's autocomplete to a reachable key
imap <C-Space> <C-n>

" add newline without entering insert mode
"nnoremap o o<Esc>
"nnoremap O O<Esc>

" Enable folding with the spacebar
nnoremap <space> za
vnoremap <space> za

source ~/.vim/vimrc-source/visual-at.vim

" plugins (vim native manager)
packadd vim-tmux-navigator
packadd vim-surround

packadd SimpylFold
let g:SimpylFold_docstring_preview=1
packadd FastFold
let g:fastfold_savehook = 0
packadd vim-stay
set viewoptions=cursor,folds,slash,unix
set viewoptions-=options

packadd YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <S-Tab>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

packadd nerdtree
map <C-q> :NERDTreeToggle<CR>

packadd vim-gitgutter
set updatetime=100

packadd ale
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 100
let g:ale_lint_on_insert_leave = 1

" load help
silent! helptags ALL
