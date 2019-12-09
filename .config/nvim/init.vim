let mapleader=","

set mouse=a
set clipboard=unnamedplus
set number relativenumber
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab		" on pressing tab, insert 4 spaces

map <leader>o :setlocal spell! spelllang=en_gb<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

map <C-n> :NERDTreeToggle<CR>

" fzf config
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_buffers_jump = 1

call plug#begin('~/.vim/plugged')
Plug 'mnpk/vim-jira-complete'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'tpope/vim-surround'
Plug 'chrisbra/Colorizer'
Plug 'scrooloose/nerdtree'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

execute pathogen#infect()

try
source ~/.config/nvim/local.vim
catch
endtry

" Map Shift Tab to tab left
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" Delete without setting clipboard
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP
