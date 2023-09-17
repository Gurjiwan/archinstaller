"nvim configuration options.

set nu
set shiftwidth=4
set nowrap
set cursorline

"nvim plugin using vim-plug package.

call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'pineapplegiant/spaceduck', {'branch':'main'}
Plug 'maxboisvert/vim-simple-complete'

call plug#end()

"any keybinds can be configured below after plug end.

"nerdtree krybinds
let g:NERDTreeDirArrowExpandable ='>'
let g:NERDTreeDirArrowCollapsible ='^'

nnoremap <C-t> :NERDTreeToggle<CR>

"set up spaceduck nvim theme
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme spaceduck
