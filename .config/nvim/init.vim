" Plugins Section (using vim-plug)
call plug#begin('~/.vim/plugged')

" TypeScript & JavaScript support
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components'  " For styled components support
Plug 'dense-analysis/ale'

" File tree & tabs & Git stuff support
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'

" Code completion and LSP (Language Server Protocol) setup
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint'
  \ ]

" Git indication
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔",
      \ 'Ignored'   : '☒',
      \ }

let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔",
      \ 'Ignored'   : '☒',
      \ }

" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1

" Enable NERDTree tab indicator
let g:airline#extensions#tabline#fnamemod = ':t'

" Enable vim-devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1

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
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> K  :call CocAction('doHover')<CR>

" Set up ESLint to run on save (make sure you have ESLint installed globally)
autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx silent! !eslint --fix %

" Use `:CocConfig` to configure Coc.nvim settings further (e.g., formatting options)"

" Show hover documentation on pressing a key (e.g., F1)
nnoremap <Leader> :call CocActionAsync('doHover')<CR>

" Move to the previous tab with Ctrl + Left Arrow
nnoremap <C-Left> :tabprevious<CR>

" Move to the next tab with Ctrl + Right Arrow
nnoremap <C-Right> :tabnext<CR>

" Trigger autocomplete on Enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Trigger autocomplete on Tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" NERDTree key bindings
nnoremap <C-d> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window
autocmd VimEnter * NERDTree | wincmd p

" Refresh NERDTree and put the cursor back in the other window
nmap <Leader>r :NERDTreeFocus<cr> \| R \| <c-w><c-p>
