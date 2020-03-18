syntax on
colorscheme escuro

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

set ignorecase
set smartcase

set completeopt=menuone,noselect

" fix backspace on mac
set backspace=indent,eol,start

set autoindent

set foldmethod=indent

nnoremap Y y$

" plugins (vim native manager)
source ~/.vim/vimrc-source/visual-at.vim

" packadd SimpylFold
" let g:SimpylFold_docstring_preview=1

" packadd FastFold
" let g:fastfold_savehook = 0


call plug#begin()
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-surround'

Plug 'preservim/nerdtree'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf'

Plug 'wsdjeg/FlyGrep.vim'

Plug 'JuliaEditorSupport/julia-vim'

Plug 'jpalardy/vim-slime'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'airblade/vim-gitgutter'

Plug 'zhimsel/vim-stay'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" vim-stay options
set viewoptions=cursor,folds,slash,unix
set viewoptions-=options

let NERDTreeShowHidden=1
map <C-q> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1 " remove the ? from the top
let NERDTreeDirArrows = 1

nnoremap <C-f> :FlyGrep<cr>

nmap <C-_> <S-v> gc 
nmap <C-/> <S-v> gc 
vmap <C-/> gc
vmap <C-_> gc

let g:slime_target = "tmux"
let g:slime_paste_file = "/tmp/vim-slime"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

" julia-vim
let g:latex_to_unicode_auto = 1

" LanguageClient-neovim config
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['~/Software/anaconda3/bin/pyls'],
    \ }

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <F5> :call LanguageClient_contextMenu()<CR>
    nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
    nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <buffer> <silent> gr :call LanguageClient#textDocument_references()<CR>
    nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction
autocmd FileType * call LC_maps()
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
