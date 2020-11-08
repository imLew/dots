set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = {"python", "julia" },     -- one of "all", "language", or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = { "c", "rust" },  -- list of language that will be disabled
"   },
" }
" EOF

" autocmd BufEnter * lua require'completion'.on_attach()

" lua << EOF
"     local nvim_lsp = require'nvim_lsp'
"     local on_attach_vim = function()
"         require'diagnostic'.on_attach()
"     end
"     nvim_lsp.julials.setup({on_attach=on_attach_vim})
" EOF
