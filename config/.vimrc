syntax on
colorscheme zenburn

" Better display for messages
set cmdheight=2

" always show signcolumns
set signcolumn=yes

set updatetime=100

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
set textwidth=0

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

" completion: always show menu, show menu with tab and move through
" with tab and shift-tab, select by pressing enter
" cancel completion by pressing esc
set completeopt=menuone,noselect
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" grepping
" command! -nargs=+ Grep execute 'silent lgrep! -I -r -n * -e <args>' | lopen | execute 'silent /<args>'
" command! -nargs=+ Grepa execute 'silent lgrepa! -I -r -n * -e <args>' | lopen | execute 'silent /<args>'
" nnoremap <C-f> :Grep 
" " [l to go to previous match
" nnoremap [l :lp<CR>
" " ]l to go to next match
" nnoremap ]l :lne<CR>
" " [L to go to first match
" nnoremap [L :lfir<CR>
" " ]L to go to last match
" nnoremap ]L :lla<CR>

" fix backspace on mac
set backspace=indent,eol,start

set autoindent
" set paste

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

packadd nerdtree
let NERDTreeShowHidden=1
map <C-q> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1 " remove the ? from the top
let NERDTreeDirArrows = 1

call plug#begin()

Plug 'tpope/vim-commentary'

" Plug 'junegunn/fzf'

Plug 'natebosch/vim-lsc'

Plug 'wsdjeg/FlyGrep.vim'

Plug 'JuliaEditorSupport/julia-vim'

Plug 'jpalardy/vim-slime'

call plug#end()

nnoremap <C-f> :FlyGrep<cr>

nmap <C-_> <S-v> gc 
nmap <C-/> <S-v> gc 
vmap <C-/> gc
vmap <C-_> gc

let g:slime_target = "tmux"
let g:slime_paste_file = "/tmp/vim-slime"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

packadd vim-gitgutter

let g:lsc_server_commands = {'python': 'pyls'}

" not sure what auto vs manual completion means
" let g:lsc_enable_autocomplete = v:false

let g:lsc_auto_map = {
    \ 'GoToDefinition': '<C-]>',
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': '<C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}
