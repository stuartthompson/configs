syntax on

" Leader
let mapleader=' '

" Show commands
set showcmd

" Line numbers
" -- Relative line numbering
set number relativenumber

" Rulers
set colorcolumn=80,120

" Tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Special Characters (tab, trailing spaces, carriage returns)
highlight SpecialKey ctermfg=3
highlight NonText ctermfg=3
set listchars=trail:␣
set list

" Highlighted Yank
highlight HighlightedyankRegion cterm=reverse gui=reverse

" NetRW
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_winsize = 20

" Plugins (vim-plug)
call plug#begin('~/.vim/plugged')

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'

" Syntax
Plug 'vim-syntastic/syntastic'

" File System
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdtree'

" Language support
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'

" Utilities
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

"''''''''''''''''''''''''''
" Post-Plugin Configuration
"..........................

" Lightline configuration
" Disable showing the mode in the bottom status bar (lightline does this now)
set noshowmode
"
let g:lightline = {
    \ 'colorscheme': 'stu-lightline-theme'
    \ }

" Markdown Preview
" -- Open MarkdownPreview browser to more than local (lets WSL host see it)
let g:mkdp_open_to_the_world = 1

" NERDTree Config
nnoremap <leader>f :NERDTree<CR>
nnoremap <leader>t :tabnew<CR>:NERDTree<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
autocmd VimEnter * NERDTree

" Snippets
source ~/.config/nvim/snippets.vim

" Syntax
syntax enable
filetype plugin indent on

" Tabs
nnoremap <leader>h :tabp<CR>
nnoremap <leader>l :tabn<CR>
nnoremap <leader>j :tabm -1<CR>
nnoremap <leader>k :tabm +1<CR>

" Theme
source ~/.config/nvim/theme/stu-theme.vim

" Maps
" Get the style underneath the cursor. (useful for coloring/theming)
map <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

