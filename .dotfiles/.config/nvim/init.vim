source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/paths.vim

if exists('g:vscode')
    " VS Code extension 
    source $HOME/.config/nvim/vscode/settings.vim
else
    source $HOME/.config/nvim/keys/mappings.vim
    source $HOME/.config/nvim/themes/gruvbox.vim
    source $HOME/.config/nvim/modules/coc.vim
    source $HOME/.config/nvim/modules/ctrlp.vim
    source $HOME/.config/nvim/modules/tableMode.vim
    source $HOME/.config/nvim/modules/todo.vim
    source $HOME/.config/nvim/modules/undotree/undotree.vim
    source $HOME/.config/nvim/unmanaged/kanvim.vim
    source $HOME/.config/nvim/modules/codi.vim
endif
