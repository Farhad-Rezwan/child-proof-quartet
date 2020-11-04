" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing

set number
set rnu
" Better Navigation
nnoremap <leader>j :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <leader>j :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <leader>k :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <leader>k :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <leader>h :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <leader>h :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <leader>l :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <leader>l :call VSCodeNotify('workbench.action.navigateRight')<CR>
