syntax on
colorscheme windflower

" turn on line numbers
set number relativenumber
set showcmd

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
    autocmd BufNewFile,BufRead *.ts,*.js,*.tsx,*.jsx set filetype=typescript
    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType markdown setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
    
    " highlight during search but not after
    augroup vimrc-incsearch-highlight
      autocmd!
      autocmd CmdLineEnter /,\? :set hlsearch
      autocmd CmdlineLeave /,\? :set nohlsearch
    augroup END
endif

" highligh while searching
set is

" color past column 80 - ruler
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" fix backspace on mac
set backspace=indent,eol,start

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

" nnoremap <Esc> :set nohlsearch<CR>
" inoremap <Esc> <Esc>:set nohlsearch<CR>
" source ~/.vim/vimrc-source/visual-at.vim

" plugins (vim native manager)
packadd typescript-vim
packadd vim-jsx-typescript
packadd vim-tmux-navigator
packadd vim-surround

packadd SimpylFold
packadd vim-airline
let g:SimpylFold_docstring_preview=1
packadd FastFold
let g:fastfold_savehook = 0
packadd vim-stay
set viewoptions=cursor,folds,slash,unix
set viewoptions-=options

" packadd YouCompleteMe
" let g:ycm_autoclose_preview_window_after_completion=1
" map <S-Tab>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

packadd nerdtree
let NERDTreeShowHidden=1
map <C-q> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif
let NERDTreeMinimalUI = 1 " remove the ? from the top
let NERDTreeDirArrows = 1

packadd ctrlsf.vim
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

packadd ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Hide files in .gitignore
let g:ctrlp_show_hidden = 1 
packadd ale
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'

packadd vim-gitgutter
set updatetime=100

packadd ale
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 100

" load help
silent! helptags ALL
