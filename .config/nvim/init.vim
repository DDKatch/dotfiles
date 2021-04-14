" --------------------
" | GENERAL SETTINGS |
" --------------------

"  plugin_manager
call plug#begin()

"  colors
Plug 'flazz/vim-colorschemes'
"             ^--------------- one colorscheme pack to rule them all!

"  search engine
"    brew install ripgrep

"  search through folder
Plug 'dyng/ctrlsf.vim'
"             ^--------------- An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'kien/ctrlp.vim'
"             ^--------------- Fuzzy file, buffer, mru, tag, etc finder

"  search through file
set hlsearch "highlight search result"

"  folder tree
Plug 'scrooloose/nerdtree'
"             ^--------------- A tree explorer plugin for vim
Plug 'jistr/vim-nerdtree-tabs'
"             ^--------------- NERDTree and tabs together in Vim, painlessly

"  global clipboard buffer
set clipboard=unnamedplus

"  line numbers
set number

"  tabs
set expandtab "spaces instead of tab"
set tabstop=2 "spaces amount for tab"
set shiftwidth=2 "amount of spaces to shift using >> and << commands"
set smartindent "use the same indent as on the line above. And some smart magic too"

"  upper buffers/tabs line + bottom status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1

"!!!  git

" ====================
" ^ GENERAL SETTINGS ^
" ====================

" !!!
set noswapfile
set mouse=a
set ffs=unix
set nocompatible
filetype off
" !!!

"------------COMPLETER-----------------

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:deoplete#enable_at_startup = 1
" https://blog.cuffaro.com/blog/2018/04/16/pyenv-neovim
let g:python_host_prog = '$HOME/.asdf/installs/python/2.7.18/bin/python'
let g:python3_host_prog = '$HOME/.asdf/installs/python/3.9.2/bin/python'
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}

"-------------LINTER-------------------
Plug 'dense-analysis/ale'
let g:ale_set_highlights = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop'],
  \ }
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
set hidden
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

" -----------------------------
" | LANGUAGE SPECIFIC PLUGINS |
" -----------------------------

"!!!   Ruby and Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
"!!!   rubocop
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-endwise'
Plug 'hwartig/vim-seeing-is-believing'
"!!!   JS
Plug 'carlitux/deoplete-ternjs'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'chemzqm/vim-jsx-improve'
"   Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"   Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" =============================
" ^ LANGUAGE SPECIFIC PLUGINS ^
" =============================

call plug#end()

" ----------------------------
" | GENERAL PLUGINS SETTINGS |
" ----------------------------

"  flazz/vim-colorschemes
colorscheme railscasts

"  dyng/ctrlsf.vim
nmap     <C-F>f <Plug>CtrlSFPrompt
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
let g:ctrlsf_ignore_dir = ['log', 'tmp', 'node_modules', 'public']
let g:ctrlsf_auto_focus = { "at": "start" }

"  scrooloose/nerdtree
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeDirArrows = 0
let NERDTreeShowHidden=1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', '\.bundle$', '\.vscode$']
map <Leader>n :NERDTreeTabsToggle<CR>

"  jistr/vim-nerdtree-tabs
let g:nerdtree_tabs_autoclose=1

"  kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = 'vendor\|node_modules\|tmp\|DS_Store\|.git'
"                              ^           ^        ^       "
"                             language specific folders     "
map <C-T> :CtrlPBuffer<CR>

" ============================
" ^ GENERAL PLUGINS SETTINGS ^
" ============================
