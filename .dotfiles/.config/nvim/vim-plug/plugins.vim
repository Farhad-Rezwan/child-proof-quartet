" auto-install vim-plug
if empty(glob('~/.nvimLoads/autoload/plug.vim'))
  silent !curl -fLo ~/.nvimLoads/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.nvimLoads/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Color Theme
    Plug 'morhetz/gruvbox'
    " Completion
    Plug 'neoclide/coc.nvim'
    " fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

    " all about the markdown
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

    " table mode
    Plug 'dhruvasagar/vim-table-mode'

    " To Do
    Plug 'vuciv/vim-bujo'

    " Undo Tree
    Plug 'mbbill/undotree'

    " And others:
    Plug 'vim-airline/vim-airline'


    " Prettier
    " post install (yarn install | npm install) then load plugin only for editing supported files
    Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }


call plug#end()
