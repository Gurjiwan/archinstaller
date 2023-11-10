"nvim configuration options.

set nu
set relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nowrap
set cursorline

"nvim plugin using vim-plug package.

call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'maxboisvert/vim-simple-complete'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'windwp/nvim-autopairs'

call plug#end()

"any keybinds can be configured below after plug end.

"nerdtree krybinds
let g:NERDTreeDirArrowExpandable ='>'
let g:NERDTreeDirArrowCollapsible ='^'

nnoremap <C-t> :NERDTreeToggle<CR>

"set up markdown preview with normal mode key mapping and insert mode as well
"ctr + s for markdown preview
inoremap <c-s> <Esc>:MarkdownPreview<cr>
nnoremap <c-s> <Esc>:MarkdownPreview<cr>

" Set Alt+s to stop markdown preview
inoremap <M-s> <Esc>:MarkdownPreviewStop<cr>
nnoremap <M-s> <Esc>:MarkdownPreviewStop<cr>

" Set vim-airline-theme as murmur
let g:airline_theme='murmur'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"autopair setup
lua << EOF
require("nvim-autopairs").setup {}
EOF
