syntax on
colorscheme rigel

set updatetime=300

set encoding=utf-8

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
" set textwidth=80

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

set nohlsearch

set ignorecase
set smartcase

" grepping
command! -nargs=+ Grep execute 'silent lgrep! -I -r -n * -e <args>' | lopen | execute 'silent /<args>'
command! -nargs=+ Grepa execute 'silent lgrepa! -I -r -n * -e <args>' | lopen | execute 'silent /<args>'
nnoremap <C-f> :Grep 
" [l to go to previous match
nnoremap [l :lp<CR>
" ]l to go to next match
nnoremap ]l :lne<CR>
" [L to go to first match
nnoremap [L :lfir<CR>
" ]L to go to last match
nnoremap ]L :lla<CR>

" " color past column 80 - ruler
" let &colorcolumn=join(range(81,999),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

" fix backspace on mac
set backspace=indent,eol,start

set autoindent

" plugins (vim native manager)
source ~/.vim/vimrc-source/visual-at.vim

packadd typescript-vim
packadd vim-jsx-typescript

packadd vim-tmux-navigator

packadd vim-surround

packadd vim-airline
let g:airline#extensions#tabline#enabled = 1

" packadd SimpylFold
" let g:SimpylFold_docstring_preview=1

" packadd FastFold
" let g:fastfold_savehook = 0

packadd vim-stay
set viewoptions=cursor,folds,slash,unix
set viewoptions-=options

" packadd YouCompleteMe
" let g:ycm_autoclose_preview_window_after_completion=1
" map <S-Tab>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

packadd nerdtree
let NERDTreeShowHidden=1
map <C-q> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1 " remove the ? from the top
let NERDTreeDirArrows = 1

packadd ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Hide files in .gitignore
let g:ctrlp_show_hidden = 1 
nnoremap <C-p> :CtrlPTag<CR>

call plug#begin()

Plug 'JuliaEditorSupport/julia-vim'

Plug 'jpalardy/vim-slime'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" coc config suggestions start here
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" end coc config

let g:slime_target = "tmux"
let g:slime_paste_file = "/tmp/vim-slime"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

" packadd ale
" let g:ale_sign_column_always = 1
" let g:ale_lint_on_text_changed = 'always'
" let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_delay = 100
" let g:airline#extensions#ale#enabled = 1
" let g:ale_set_highlights = 0

packadd vim-gitgutter
set updatetime=50

" load help
silent! helptags ALL
