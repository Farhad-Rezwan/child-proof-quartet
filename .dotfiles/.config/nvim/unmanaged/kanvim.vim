function! s:KanvimCreate()
    call append(0, '# Title')
    call append(1, '')
    call append(2, 'Description')
    call append(3, '')
    call append(4, '## To Do')
    call append(5, '')
    call append(6, '- Task')
    call append(7, '')
    call append(8, '## Doing')
    call append(9, '')
    call append(10, '')
    call append(11, '## Done')
    call append(12, '')
endfunction

command! -nargs=0 KanvimCreate call s:KanvimCreate()

" Move to
function! s:KanvimMoveToNext()
    execute 'normal dd'
    silent execute '/##'
    execute 'normal jp'
endfunction

command! -nargs=0 KanvimMoveToNext call s:KanvimMoveToNext()

function! s:KanvimMoveToPrevious()
    execute 'normal dd'
    silent execute '?##'
    silent execute '?##'
    execute 'normal jp'
endfunction

command! -nargs=0 KanvimMoveToPrevious call s:KanvimMoveToPrevious()

" Go to
function! s:KanvimGoToNext()
    silent execute '/##'
endfunction

command! -nargs=0 KanvimGoToNext call s:KanvimGoToNext()

function! s:KanvimGoToPrevious()
    silent execute '?##'
endfunction

command! -nargs=0 KanvimGoToPrevious call s:KanvimGoToPrevious()
