set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" nvim integrated LSP stuff, not working ootb
" nnoremap <silent> ;dc :call lsp#text_document_declaration()<CR>
" nnoremap <silent> ;df :call lsp#text_document_definition()<CR>
" nnoremap <silent> ;h  :call lsp#text_document_hover()<CR>
" nnoremap <silent> ;i  :call lsp#text_document_implementation()<CR>
" nnoremap <silent> ;s  :call lsp#text_document_signature_help()<CR>
" nnoremap <silent> ;td :call lsp#text_document_type_definition()<CR>

" let settings = {
"           \   "pyls" : {
"           \     "enable" : v:true,
"           \     "trace" : { "server" : "verbose", },
"           \     "commandPath" : "",
"           \     "configurationSources" : [ "pycodestyle" ],
"           \     "plugins" : {
"           \       "jedi_completion" : { "enabled" : v:true, },
"           \       "jedi_hover" : { "enabled" : v:true, },
"           \       "jedi_references" : { "enabled" : v:true, },
"           \       "jedi_signature_help" : { "enabled" : v:true, },
"           \       "jedi_symbols" : {
"           \         "enabled" : v:true,
"           \         "all_scopes" : v:true,
"           \       },
"           \       "mccabe" : {
"           \         "enabled" : v:true,
"           \         "threshold" : 15,
"           \       },
"           \       "preload" : { "enabled" : v:true, },
"           \       "pycodestyle" : { "enabled" : v:true, },
"           \       "pydocstyle" : {
"           \         "enabled" : v:false,
"           \         "match" : "(?!test_).*\\.py",
"           \         "matchDir" : "[^\\.].*",
"           \       },
"           \       "pyflakes" : { "enabled" : v:true, },
"           \       "rope_completion" : { "enabled" : v:true, },
"           \       "yapf" : { "enabled" : v:true, },
"           \     }}}
" call nvim_lsp#setup("pyls", settings)

" " disable preview window
" set completeopt-=preview

" " use omni completion provided by lsp
" set omnifunc=lsp#omnifunc
