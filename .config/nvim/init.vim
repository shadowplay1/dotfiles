" Plugins Section (using vim-plug)
call plug#begin('~/.vim/plugged')

" TypeScript & JavaScript support
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'  " For styled-components support
Plug 'dense-analysis/ale'

" Code completion and LSP (Language Server Protocol) setup
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint'
  \ ]

" Themes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'

call plug#end()

" Enable the plugins
filetype plugin indent on

" Configuration for TypeScript plugins
let g:typescript_indent_disable = 1  " Disable built-in indenting for TypeScript

" Configure your colorscheme (replace 'dracula' with your preferred theme)
colorscheme dracula
set number

" Optional: Key mappings for Coc.nvim (e.g., auto-completion, go to definition)
" nnoremap <silent> gd <Plug>(coc-definition)
" nnoremap <silent> gy <Plug>(coc-type-definition)
" nnoremap <silent> gi <Plug>(coc-implementation)
" nnoremap <silent> gr <Plug>(coc-references)
" nnoremap <silent> K  :call CocAction('doHover')<CR>

" Set up ESLint to run on save (make sure you have ESLint installed globally)
autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx silent! !eslint --fix %

" Use `:CocConfig` to configure Coc.nvim settings further (e.g., formatting options)"

" Show hover documentation on pressing a key (e.g., F1)
nnoremap <Leader> :call CocActionAsync('doHover')<CR>

" Trigger autocomplete on Enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Trigger autocomplete on Tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

