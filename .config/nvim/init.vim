" --------------------
" | GENERAL SETTINGS |
" --------------------

set hidden "opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
set clipboard=unnamedplus "set global clipboard buffer so it makes possible to selected text in vim and paste it somewhere else

set expandtab " always uses spaces instead of tab characters
set tabstop=2 "spaces amount for tab"
set shiftwidth=2 "amount of spaces to shift using >> and << commands"
set smartindent "use the same indent as on the line above. And some smart magic too"

set noswapfile " disables usage of a swapfile for the buffer (.swp files)
set mouse=a " allow scrolling, picking, selecting with mouse?
set ffs=unix " use unix line-ending in files
set number "enable line numbers
set hlsearch "highlight search in file results"

"  plugin_manager
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"  colors
Plug 'marko-cerovac/material.nvim'
if (has("termguicolors"))
	set termguicolors  " this variable must be enabled for colors to be applied properly
endif

"  file icons
Plug 'kyazdani42/nvim-web-devicons'

"  code highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"  search through folder
Plug 'dyng/ctrlsf.vim'     "An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'kien/ctrlp.vim'      "Fuzzy file, buffer, mru, tag, etc finder

"  folder tree
Plug 'kyazdani42/nvim-tree.lua'

"  bottom status line
Plug 'hoob3rt/lualine.nvim', { 'branch': 'master' }

"  upper buffers/tabs line
Plug 'akinsho/nvim-bufferline.lua'

" git
Plug 'f-person/git-blame.nvim'



" ====================
" ^ GENERAL SETTINGS ^
" ====================


"-------------LINTER + COMPLETER-------------------

Plug 'neoclide/coc.nvim', {'branch': 'release'}

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" select complete variant by pushing ENTER button
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" -----------------------------
" | LANGUAGE SPECIFIC PLUGINS |
" -----------------------------

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

" marko-cerovac/material.nvim
luafile $HOME/.config/nvim/nvim-treesitter.lua

" nvim-treesitter/nvim-treesitter
luafile $HOME/.config/nvim/material.lua

" hoob3rt/lualine.nvim
luafile $HOME/.config/nvim/evil_lualine.lua

" akinsho/nvim-bufferline.lua
luafile $HOME/.config/nvim/bufferline.lua

" kyazdani42/nvim-tree.lua
luafile $HOME/.config/nvim/nvim-tree.lua

" f-person/git-blame.nvim
let g:gitblame_message_template = '         <sha> • <summary> • <author> • <date>'
let g:gitblame_date_format = '%r'

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
