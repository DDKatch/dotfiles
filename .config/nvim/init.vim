" --------------------
" | GENERAL SETTINGS |
" --------------------
<<<<<<< HEAD
=======

set hidden "opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
set clipboard=unnamedplus "set global clipboard buffer so it makes possible to selected text in vim and paste it somewhere else

>>>>>>> Clean minor sections
"  plugin_manager
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"  colors
Plug 'tjdevries/colorbuddy.nvim'
Plug 'marko-cerovac/material.nvim', { 'branch': 'colorbuddy' }
if (has("termguicolors"))
	set termguicolors  " this variable must be enabled for colors to be applied properly
endif

"  file icons
Plug 'kyazdani42/nvim-web-devicons'

"  code highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" ⬆️  not sure it works

"  search through folder
Plug 'dyng/ctrlsf.vim'     "An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'kien/ctrlp.vim'      "Fuzzy file, buffer, mru, tag, etc finder

"  folder tree
Plug 'kyazdani42/nvim-tree.lua'

"  bottom status line
Plug 'hoob3rt/lualine.nvim', { 'branch': 'master' }

"  upper buffers/tabs line
Plug 'akinsho/nvim-bufferline.lua'

"!!!  git

set tabstop=2 "spaces amount for tab"
set shiftwidth=2 "amount of spaces to shift using >> and << commands"
set smartindent "use the same indent as on the line above. And some smart magic too"
set noswapfile " disables usage of a swapfile for the buffer (.swp files)
set mouse=a " allow scrolling, picking, selecting with mouse?
set ffs=unix " use unix line-ending in files
set number "enable line numbers
set hlsearch "highlight search in file results"

" ====================
" ^ GENERAL SETTINGS ^
" ====================


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
		\   'javascript': ['eslint'],
		\  	'ruby': ['rubocop'],
		\}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1

"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"let g:LanguageClient_serverCommands = {
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ }

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

" hoob3rt/lualine.nvim
luafile $HOME/.config/nvim/evil_lualine.lua

" akinsho/nvim-bufferline.lua
"⬇️  does not really work, IDK why
luafile $HOME/.config/nvim/bufferline.lua

" kyazdani42/nvim-tree.lua
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 25 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_gitignore = 0 "0 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR> "leader is a \ key by default
nnoremap <leader>n :NvimTreeFindFile<CR>
" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

"  marko-cerovac/material.nvim
let g:material_style = 'deep ocean'
let g:material_flat_ui = 1
let g:material_italic_comments = 1
let g:material_italic_keywords = 1
let g:material_italic_functions = 1
let g:material_italic_variables = 0
let g:material_contrast = 1
let g:material_borders = 0
let g:material_disable_background = 0
colorscheme material

"  dyng/ctrlsf.vim
nmap     <C-F>f <Plug>CtrlSFPrompt
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
let g:ctrlsf_ignore_dir = ['log', 'tmp', 'node_modules', 'public']
let g:ctrlsf_auto_focus = { "at": "start" }

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


"====================
"|  TIPS AND TRICS  |
"====================

"-----visualize tab with ⇥ symbol-------
"-----(tab becomes an actual tab)-------
"set list
"set listchars=tab:\⇥\ ,trail:·,extends:>,precedes:<,nbsp:+
"---------------------------------------

"-----load local dir .vimrc file--------
"set exrc
"set secure
"---------------------------------------

"====================
"^  TIPS AND TRICS  ^
"====================
