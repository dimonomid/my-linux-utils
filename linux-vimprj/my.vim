
let s:sVimprjPath  = expand('<sfile>:p:h')
let s:sPath  = simplify(s:sVimprjPath.'/..')

set ts=8
set sw=8
set noexpandtab

set colorcolumn=81

let g:indexer_indexerListFilename = s:sVimprjPath.'/.indexer_files'

" Linux Kernel is too large, so we can't afford regenerating tags every time
let g:indexer_dontUpdateTagsIfFileExists = 1

" simplify tags somewhat (not so much)
let g:indexer_ctagsCommandLineOptions = '--c++-kinds=+p+l'

