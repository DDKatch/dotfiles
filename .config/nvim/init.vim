" TODO Migrate to LSP instead of CoC
" TODO change autocomplete window selected item background color
" TODO Add go to definition plugin

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

"paste above cursor line
nmap p :pu!<CR>
"paste below cursor line (as usual)
nmap pp :pu<CR>

luafile $HOME/.config/nvim/general.lua

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
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'master'}

" indentation highlight
Plug 'lukas-reineke/indent-blankline.nvim'

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

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Allows use autocomplete by pressing TAB. Used in lsps.lua
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.0.0', 'do': 'make install_jsregexp'}

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ CheckBackspace() ? "\<Tab>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
"function! CheckBackspace() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" select complete variant by pushing ENTER button
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
"				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

luafile $HOME/.config/nvim/nvim-treesitter.lua
luafile $HOME/.config/nvim/material.lua
luafile $HOME/.config/nvim/evil_lualine.lua
luafile $HOME/.config/nvim/bufferline.lua
luafile $HOME/.config/nvim/nvim-tree.lua
luafile $HOME/.config/nvim/indent-blankline.lua
luafile $HOME/.config/nvim/lsps.lua

" f-person/git-blame.nvim
let g:gitblame_message_template = '         <sha> • <summary> • <author> • <date>'
let g:gitblame_date_format = '%r'

"  dyng/ctrlsf.vim
nmap     <C-F>f <Plug>CtrlSFPrompt
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
let g:ctrlsf_ignore_dir = ['log', 'tmp', 'node_modules', 'public', '.git', 'public']
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

"set incsearch
"set hlsearch " Highlight search result
"highlight Search ctermbg=LightYellow ctermfg=Red cterm=bold,italic guibg=LightYellow guifg=Red gui=bold,italic
"
set cursorline
"set backspace=indent,eol,start
"set matchpairs+=<:>
"highlight MatchParen ctermbg=green ctermfg=blue guibg=green guifg=blue
"
"" Code fold setting: za: on/off current fold, zM: off all folds, zR: on all folds
"set foldmethod=syntax
"set nofoldenable " on/off
"
"set colorcolumn=80 " The code width line
highlight ColorColumn ctermbg=DarkGray guibg=LightGray
highlight clear SpellBad
highlight SpellBad cterm=underline,italic gui=underline,italic

set smartcase

" Backup config
set backup
set backupdir=~/.nvim/backup/
set writebackup " Make backup before overwriting the current buffer
set backupcopy=yes " Overwrite the original backup file
" The backup file name, e.g. filename@2015-04-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

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
"
"-------sudo tee hack-------------------
":w !sudo tee %
"---------------------------------------

"====================
"^  TIPS AND TRICS  ^
"====================

command! -range FormatJson <line1>,<line2>!xargs -0 -I {} node -e 'console.log(JSON.stringify({}, null, 2));'
