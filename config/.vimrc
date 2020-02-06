syntax on
colorscheme zenburn

" Better display for messages
set cmdheight=2

" always show signcolumns
set signcolumn=yes

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

" completion: always show menu, show menu with tab and move through
" with tab and shift-tab, select by pressing enter
" cancel completion by pressing esc
set completeopt=menuone,noselect
" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" grepping
command! -nargs=+ Grep execute 'silent lgrep! -I -r -n * -e <args>' | lopen | execute 'silent /<args>'
command! -nargs=+ Grepa execute 'silent lgrepa! -I -r -n * -e <args>' | lopen | execute 'silent /<args>'
" nnoremap <C-f> :Grep 
" " [l to go to previous match
" nnoremap [l :lp<CR>
" " ]l to go to next match
" nnoremap ]l :lne<CR>
" " [L to go to first match
" nnoremap [L :lfir<CR>
" " ]L to go to last match
" nnoremap ]L :lla<CR>

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

packadd nerdtree
let NERDTreeShowHidden=1
map <C-q> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1 " remove the ? from the top
let NERDTreeDirArrows = 1

call plug#begin()

Plug 'tpope/vim-commentary'

" Plug 'junegunn/fzf'

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

Plug 'wsdjeg/FlyGrep.vim'

Plug 'JuliaEditorSupport/julia-vim'

Plug 'jpalardy/vim-slime'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
set updatetime=50

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>"" language client neovim suggested conf

