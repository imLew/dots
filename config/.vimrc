syntax on
colorscheme escuro

" Better display for messages
set cmdheight=2

" better file related searches
set path+=**

command! MakeTags !ctags -R .

" always show signcolumns
" set signcolumn=yes

" set updatetime=100

set encoding=utf-8

" turn on line numbers
set number relativenumber
set showcmd

" allow unsaved buffers to be hidden (ie not displayed)
set hidden

filetype plugin indent on

"By default use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

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

set splitbelow
set splitright

set completeopt=menuone

set noshowmode

" fix backspace on mac
set backspace=indent,eol,start

set autoindent

set foldmethod=indent

set mouse+=a

nnoremap Y y$

" faster copy past and save and exit
nnoremap <Leader>Y "+Y
vnoremap <Leader>Y "+Y
nnoremap <Leader>P "+P
vnoremap <Leader>P "+P
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>


call plug#begin()

    Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

    Plug 'tpope/vim-surround'

    Plug 'preservim/nerdtree'
    let NERDTreeShowHidden=1
    map <C-q> :NERDTreeToggle<CR>
    let NERDTreeMinimalUI = 1 " remove the ? from the top
    let NERDTreeDirArrows = 1

    Plug 'christoomey/vim-tmux-navigator'

    Plug 'tpope/vim-commentary'
    " sometimes ctrl+/ is understood as ctrl+_
    nmap <C-_> <S-v> gc 
    nmap <C-/> <S-v> gc 
    vmap <C-/> gc
    vmap <C-_> gc

    " Plug 'junegunn/fzf'

    Plug 'wsdjeg/FlyGrep.vim'
    nnoremap <C-f> :FlyGrep<cr>

    Plug 'JuliaEditorSupport/julia-vim'
    let g:latex_to_unicode_auto = 1

    Plug 'jpalardy/vim-slime'
    let g:slime_target = "tmux"
    let g:slime_paste_file = "/tmp/vim-slime"
    let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

    " Plug 'neovim/nvim-lsp'

    " Plug 'autozimu/LanguageClient-neovim', {
    "     \ 'branch': 'next',
    "     \ 'do': 'bash install.sh',
    "     \ }

    Plug 'airblade/vim-gitgutter'

    Plug 'zhimsel/vim-stay'
    set viewoptions=cursor,folds,slash,unix
    set viewoptions-=options

call plug#end()
