syntax on
try
    source ~/.config/nvim/local.vim
catch
endtry

let mapleader=" "

" Searching
set incsearch " highlight as you search
set hlsearch " highlight all instances, see esc remap

set noshowmode  " to get rid of thing like --INSERT--
set hidden

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab " tabs are spaces
set smartindent
set nowrap
set smartcase " Line Numbers
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

" Folding
set foldmethod=syntax " syntax highlighting items specify folds
let javaScript_fold=1 " activate folding by JS syntax
let php_folding=1
set foldlevelstart=99 " start file with all folds opened

" Filetype presets
autocmd FileType javascript,javascriptreact setlocal ts=2 sts=2 sw=2

" Node
" let g:coc_node_path = '/home/marcus/.nvm/versions/node/v10.15.3/bin/node' - REMOVE!!!

" Auto install Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" General
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'szw/vim-maximizer'
Plug 'scrooloose/vim-slumlord'

" General coding
Plug 'AndrewRadev/tagalong.vim'
Plug 'airblade/vim-rooter' " Auto change to project root on file open
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'kdheepak/lazygit.vim'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot' " Language packs
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'Galooshi/vim-import-js'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'APZelos/blamer.nvim'

" Styling
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

" Syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'aklt/plantuml-syntax'

"Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

call plug#end()

"======= Plugin config =====

" general
let g:colorizer_auto_color = 1
let g:fzf_preview_use_dev_icons = 1
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" undotree
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1

" Fugitive
set diffopt+=vertical

" Blamer
let g:blamer_enabled = 1

"========= Styling =========
if has('termguicolors') && !$TERM_PROGRAM =~ "Apple_Terminal"
  set termguicolors
endif
function! MyHighlights() abort
    highlight link CocCodeLens Whitespace
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
colorscheme gruvbox-material
hi! Normal ctermbg=NONE guibg=NONE

" gruvbox-material (order important for transparency
let g:gruvbox_material_transparent_background = 1
set background=dark

"========= Remaps ============

" General
nnoremap <ESC> :nohlsearch<CR>| " On esc remove search highlight
nnoremap <silent> <leader>lg :LazyGit<CR>
nnoremap <leader>u :UndotreeShow<CR>
map <leader>o :setlocal spell! spelllang=en_gb<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
map <c-t> :let $VIM_DIR=expand('%:p:h')<CR>:belowright split<CR>:terminal<CR>cd $VIM_DIR<CR>

" Pretier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Fzf and Preview
nnoremap <C-p> :FzfPreviewProjectFiles<CR>
nnoremap <C-b> :FzfPreviewBuffers<CR>
nnoremap <C-e> :FzfPreviewProjectMruFiles<CR>
nnoremap <C-h> :FzfPreviewOldFiles<CR>
nnoremap <C-f> :Rg<CR>

" Fugitive
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>
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
nnoremap <silent>= :vertical resize +5<CR>
nnoremap <silent>- :vertical resize -5<CR>
nnoremap <silent>0 :vertical resize 100%<CR>

" Git
nnoremap <leader>g :BlamerToggle<CR>

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
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

"+========== General Commands ===========

" Autotrim whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Expand snippet with tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
