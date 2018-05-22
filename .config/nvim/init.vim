syntax on
set tabstop=2
set expandtab
set shiftwidth=2
set hidden
retab
set number
set hlsearch
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%l\ %p
set laststatus=2
set noswapfile
set mouse=a
set relativenumber
set clipboard=unnamedplus

vmap <C-x> "+x <CR>
" vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-c> "+y
nnoremap <C-j> :bprevious<CR>
nnoremap <C-k> :bnext<CR>
nnoremap <C-left> :vertical resize +3<cr>
nnoremap <C-down> :resize +3<cr>
nnoremap <C-up> :resize -3<cr>
nnoremap <C-right> :vertical resize -3<cr>

nnoremap ss a<space><esc>

set nocompatible
filetype off

call plug#begin()


"Plugs
Plug 'vim-scripts/Vimball'
Plug 'vim-scripts/tComment'
"Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Linter + completer
" Plug 'w0rp/ale'

"------------COMPLETER-----------------
" (Optional) Multi-entry selection UI
Plug 'junegunn/fzf'
" (Completion plugin option 2)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"-------------LINTER-------------------
"Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ } (Completion plugin option 1)
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-rct-complete'

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"---------------------------------------
" Ruby and Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'
"
" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-endwise'
" Plug 'scrooloose/syntastic'
Plug 'hwartig/vim-seeing-is-believing'
" git
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
"
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'kien/ctrlp.vim'
Plug 'slim-template/vim-slim'
Plug 'danro/rename.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/vim-eco'
Plug 'alvan/vim-closetag'
Plug 'rust-lang/rust.vim'
Plug 'mileszs/ack.vim'
" grep
Plug 'MarSoft/nerdtree-grep-plugin'
" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'tomasr/molokai'
Plug 'jpo/vim-railscasts-theme'
Plug 'croaker/mustang-vim'

call plug#end()
filetype plugin indent on

set t_Co=256
colorscheme mustang
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" fonts airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" closetag
let g:closetag_filenames = "*.html,*.haml,*.hamlc,*.jst,*.jst.eco,*.slim, *.erb, *.pdf"
" gitgutter
" let g:gitgutter_max_signs=1000
" nnoremap [h :GitGutterPrevHunk<Cr>
" nnoremap ]h :GitGutterNextHunk<Cr>
" nnoremap <Leader>guh :GitGutterUndoHunk<Cr>

" autocomplete
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" let g:ycm_server_python_interpreter=2.7
set completeopt-=preview

" ===== Seeing Is Believing =====
" Assumes you have a Ruby with SiB available in the PATH
" If it doesn't work, you may need to `gem install seeing_is_believing -v 3.0.0.beta.6`
" ...yeah, current release is a beta, which won't auto-install
autocmd FileType ruby nmap <buffer> <C-b> <Plug>(seeing-is-believing-mark-and-run)
autocmd FileType ruby xmap <buffer> <C-b> <Plug>(seeing-is-believing-mark-and-run)

" autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
" autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
" autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)
"
" autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
" autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)

" vimdiff configs
:set diffopt+=vertical
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
highlight Search     cterm=NONE ctermfg=10 ctermbg=17

" seeing-is-believing
nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
xmap <buffer> <F5> <Plug>(seeing-is-believing-run)
imap <buffer> <F5> <Plug>(seeing-is-believing-run)

nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

" jsbeautify
nmap <C-e> :call JsBeautify()<cr>

" CTags
nmap <silent> <C-L> :ta <C-R><C-W><cr>
nmap <silent> <C-G> :!ctags -R . $(bundle list --paths)<cr>

" No highlight
nmap <silent> <C-I> :noh<cr>

" NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeDirArrows = 0
let NERDTreeShowHidden=1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', '\.bundle$']

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = '\.git$'
map <C-T> :CtrlPBuffer<CR>

" vim-nerdtree-tabs.vim
let g:nerdtree_tabs_autoclose=1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'powerlineish'

" Syntastic
let g:syntastic_ruby_exec = "/home/mist/.rvm/rubies/ruby-2.3.0/bin/ruby"
let g:syntastic_eruby_checkers=['mri']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" run ruby files
function RunWith (command)
  execute "w"
  execute "!clear;" . a:command . " " . expand("%")
endfunction

autocmd FileType ruby nmap <Leader>e :call RunWith("ruby")<cr>

if has("syntax")
  au BufNewFile,BufRead *.jsonify set filetype=ruby
  au BufNewFile,BufRead *.skim    set filetype=slim
  au BufNewFile,BufRead *.ast     set filetype=slim
endif

" Go plugin configuration
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
let mapleader=' '

" vim-rspec
map <Leader>s :call RunCurrentSpecFile()()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>sp :set paste<CR>
map <Leader>snp :set nopaste<CR>

nmap <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

" config for https://github.com/jistr/vim-nerdtree-tabs

autocmd QuickFixCmdPost *grep* cwindow
au BufRead,BufNewFile *.hamlc set filetype=haml
au BufRead,BufNewFile *.rabl set filetype=ruby

" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
" let g:ycm_server_python_interpreter = 
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
