nmap [m [j
nmap ]m ]j
nmap [M [J
nmap ]M ]J

" don't show all the warnings in the scrap file
autocmd BufEnter scrap.jl :call CocAction('diagnosticToggle')
autocmd BufLeave scrap.jl :call CocAction('diagnosticToggle')

