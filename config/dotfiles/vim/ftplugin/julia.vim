" nmap [m [j
" nmap ]m ]j
" nmap [M [J
" nmap ]M ]J

" don't show all the warnings in the scrap file
autocmd BufEnter scrap.jl :call CocAction('diagnosticToggle')
autocmd BufLeave scrap.jl :call CocAction('diagnosticToggle')

function! SendRegion(region, restore_cursor)
    let l:winview = winsaveview()
    if a:region == "function"
        normal vaf
    elseif a:region == "line"
        normal V
    elseif a:region == "paragraph"
        normal vap
    elseif a:region == "cell"
        " normal ?##
        let l:begin_cell = search("##", 'bc')
        normal V
        let l:end_cell = search("##")
        normal k
    endif
    execute "normal \<Plug>SlimeRegionSend"
    if a:restore_cursor == 1
        call winrestview(l:winview)
    elseif a:region == "cell"
        let l:end_cell = search("##")
        normal j
    elseif a:region == "line"
        normal j
    elseif a:region == "paragraph"
        normal }
    endif
endfunction
" map <F8>, <F9>, <F10> to Slime send the current line, paragraph or cell in
" normal mode and map all of them to send the current selection in visual
" pressing them together with ctrl moves to the next line, paragraph or cell
" after sliming it or to the line after the visual selection
nmap <F34> :call SendRegion("cell", 0)<CR>
nmap <F10> :call SendRegion("cell", 1)<CR>
nmap <F33> :call SendRegion("paragraph", 0)<CR>
nmap <F9> :call SendRegion("paragraph", 1)<CR>
nmap <F32> :call SendRegion("line", 0)<CR>
nmap <F8> :call SendRegion("line", 1)<CR>
vmap <F32> <Plug>SlimeRegionSend`>j
vmap <F33> <Plug>SlimeRegionSend`>j
vmap <F34> <Plug>SlimeRegionSend`>j
vmap <F8> <Plug>SlimeRegionSend
vmap <F9> <Plug>SlimeRegionSend
vmap <F10> <Plug>SlimeRegionSend
imap <F10> <Esc><F10>a
imap <F9> <Esc><F9>a
imap <F8> <Esc><F8>a
" nmap <F7> :new \| silent! read !julia --project=~/Documents/BCCN_Master/SVGD-stuff/Thesis/flow-VI #<CR>
