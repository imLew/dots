let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 1
let g:completion_timer_cycle = 200 "default value is 80"

" julia
let g:default_julia_version = '1.0'

" language server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = "/home/lew/Documents/BCCN_Master/Stein_labrot/svgd-things/";
\
\       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, env_path);
\       server.runlinter = true;
\       run(server);
\   ']
\ }
" \       env_path = dirname(Pkg.Types.Context().env.project_file);

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>rn :call LanguageClient_textDocument_rename()<CR>

