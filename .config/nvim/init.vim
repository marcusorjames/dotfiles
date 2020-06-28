syntax on

try
    source ~/.config/nvim/local.vim
catch
endtry

let mapleader=" "

" Searching
set incsearch " highlight as you search
set hlsearch " highlight all instances, see esc remap

set hidden

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab " tabs are spaces
set smartindent
set nowrap
set smartcase

" Line Numbers
set nu
set relativenumber

" Visual
set noshowmatch " Prevents weird cursor jump on parenth match e.g. (hello)
set scrolloff=8 " Scrolls at line
set colorcolumn=80
set mouse=a " Mouse select visual mode
set list
set listchars=tab:>\ ,trail:~,extends:\#,nbsp:.

" Removes the swapfile and instead use undu plugin
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set updatetime=100
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set clipboard=unnamedplus
set noerrorbells " No dings

call plug#begin('~/.vim/plugged')
" General
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'

" General coding
Plug 'editorconfig/editorconfig-vim'
Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot' " Language packs
Plug 'tpope/vim-commentary'

" Styling
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

" Syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'

call plug#end()

"======= Plugin config =====

" undotree
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1

" Fzf and Preview
let g:fzf_preview_use_dev_icons = 1

"========= Styling =========
if has('termguicolors')
  set termguicolors
endif
colorscheme gruvbox-material
hi! Normal ctermbg=NONE guibg=NONE

" gruvbox-material (order important for transparency
let g:gruvbox_material_transparent_background = 1
set background=dark

"========= Remaps ============

" General
nnoremap <ESC> :nohlsearch<CR> " On esc remove search highlight
nnoremap <silent> <leader>lg :LazyGit<CR>
nnoremap <leader>u :UndotreeShow<CR>
map <leader>o :setlocal spell! spelllang=en_gb<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Fzf and Preview
nnoremap <C-p> :FzfPreviewGitFiles<CR>
nnoremap <C-b> :FzfPreviewBuffers<CR>
nnoremap <C-e> :FzfPreviewProjectMruFiles<CR>
nnoremap <C-f> :Rg<CR>

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>rr <Plug>(coc-rename)
nmap <silent>g[ <Plug>(coc-diagnostic-prev)
nmap <silent>g] <Plug>(coc-diagnostic-next)
nmap <silent> <silent>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <silent>gn <Plug>(coc-diagnostic-next-error)
nnoremap <silent>cr :CocRestart

" Navigation and Windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>0 :vertical resize 100%<CR>

function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction

nnoremap <C-n> :call NerdTreeToggleFind()<CR>

" Compiling
map <leader>c :w! \| !compiler <c-r>%<CR>| " Compile document, be it groff/LaTeX/markdown/etc.
map <leader>p :!opout <c-r>%<CR><CR>| " Open corresponding .pdf/.html or preview doesn't work

" Map Shift Tab to tab left
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d> 

" Delete without setting clipboard
nnoremap <leader>d "_d
xnoremap <leader>p "_dP


"+========== General Commands ===========
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
