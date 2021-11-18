" Visuals
set number
set cursorline
set cursorcolumn
set wrap
highlight cursorline cterm=bold ctermbg=darkgrey 
highlight cursorcolumn ctermbg=darkgrey 

" Macros
imap jj <ESC>

" Tabs
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab
        
" PLUGINS

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
call plug#end()

