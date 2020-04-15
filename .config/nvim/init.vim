let mapleader=","

filetype plugin on

set guifont=Fira\ Code\ 14
set mouse=a
set clipboard=unnamedplus
set number relativenumber
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab		" on pressing tab, insert 4 spaces
set autoindent

set list
set listchars=tab:>\ ,trail:~,extends:\#,nbsp:.

map <leader>o :setlocal spell! spelllang=en_gb<CR>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

map <C-n> :NERDTreeToggle<CR>

" fzf config
nnoremap <C-p> :FZF<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-f> :Ag<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_buffers_jump = 1

" set php manual
autocmd FileType php set keywordprg=pman

call plug#begin('~/.vim/plugged')
Plug 'mnpk/vim-jira-complete'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'tpope/vim-surround'
Plug 'chrisbra/Colorizer'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'bkad/CamelCaseMotion'
Plug 'easymotion/vim-easymotion'

" Php
Plug 'arnaud-lb/vim-php-namespace'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" General coding
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
call plug#end()


" Autocomplete
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let g:deoplete#enable_at_startup = 1

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

" CamelCaseMotion
let g:camelcasemotion_key = '<leader>'

" GitGutter
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=2


" Gutentags
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root  = ['package.json', '.git', '.hg', '.svn']
let g:gutentags_cache_dir = expand('~/.gutentags_cache')
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = ['--tag-relative=yes','--fields=+ailmnS']
let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\]

set updatetime=100
