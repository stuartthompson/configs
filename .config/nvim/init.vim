syntax on

" Leader
let mapleader=' '

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

" Debugging
Plug 'puremourning/vimspector'

" Utilities
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" Plugin Configuration
"
" Markdown Preview
" -- Open MarkdownPreview browser to more than local (lets WSL host see it)
let g:mkdp_open_to_the_world = 1

" File System
nnoremap <leader>f :NERDTree

" Snippets
source ~/.config/nvim/snippets.vim

" Theme
source ~/.config/nvim/theme/stu-theme.vim

" Termdebug
packadd termdebug

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'CodeLLDB' ]

" Maps
map <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

