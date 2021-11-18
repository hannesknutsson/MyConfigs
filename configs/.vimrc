" Visuals
set number
" set cursorline
" set cursorcolumn
" set wrap
" highlight cursorline cterm=bold ctermbg=darkgrey
" highlight cursorcolumn ctermbg=darkgrey

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
Plug 'airblade/vim-gitgutter'           " Add Git diff characters in the left gutter
Plug 'jiangmiao/auto-pairs'             " Automatically create matching () {} [] '' and so on
Plug 'dense-analysis/ale'               " Some syntax-checking that might be shite
Plug 'tpope/vim-sensible'               " Good default settings for vim
Plug 'bronson/vim-trailing-whitespace'  " Mark trailing whitespace and add a FixWhitespace command that removes all trailing whitespace
Plug 'luochen1990/rainbow'              " Color matching parantheses
Plug 'valloric/matchtagalways'          " Highlight matching XML tags
Plug 'vim-scripts/AutoComplPop'         " Automatically pop completion list
Plug 'ervandew/supertab'                " Allow using tabs to scroll through completion
call plug#end()

"   Activate rainbow brackets
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"   Make completion scroll down instead of up
let g:SuperTabDefaultCompletionType = "<c-n>"

