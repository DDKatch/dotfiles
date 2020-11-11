" --------------------
" | GENERAL SETTINGS |
" --------------------

"  plugin_manager
call plug#begin()

"  colors
Plug 'flazz/vim-colorschemes'
"                     ^------- one colorscheme pack to rule them all!

"  search through folder
Plug 'dyng/ctrlsf.vim'
"             ^--------------- An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2

"  search through file
set hlsearch "highlight search result"

"!!!  folder tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'MarSoft/nerdtree-grep-plugin'
"  global buffer
set clipboard=unnamedplus

"  line numbers
set number

"  tabs
set tabstop=2 "spaces amount for tab"
set shiftwidth=2 "amount of spaces to shift using >> and << commands"
set smartindent "use the same indent as on the line above. And some smart magic too"

"  status line
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%l\ %p "Dark magick happens here. It just works. I don't want even touch it"
set laststatus=2 "status line display mode: always"

"!!!  git

" ====================
" ^ GENERAL SETTINGS ^
" ====================

set noswapfile
set mouse=a
set ffs=unix
set nocompatible
filetype off

"pug
Plug 'digitaltoad/vim-pug'

"Plugs
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" begin
Plug 'ryanoasis/vim-devicons'
set encoding=UTF-8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
" end

" GTags
Plug 'jsfaint/gen_tags.vim'

" Search
Plug 'wsdjeg/FlyGrep.vim'

"------------COMPLETER-----------------

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:deoplete#enable_at_startup = 1
let g:python_host_prog = '/Users/mbmist/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/mbmist/.pyenv/versions/neovim3/bin/python'
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

" JS
Plug 'carlitux/deoplete-ternjs'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'chemzqm/vim-jsx-improve'
" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


""-------------LINTER-------------------
Plug-'dense-analysis/ale'
let g:ale_set_highlights = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
" fonts airline config
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
set hidden
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

"
"---------------------------------------
" Ruby and Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
" rubocop
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-endwise'
Plug 'hwartig/vim-seeing-is-believing'
" Markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
"
Plug 'posva/vim-vue'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'groenewege/vim-less'
Plug 'kien/ctrlp.vim'
Plug 'slim-template/vim-slim'
Plug 'danro/rename.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/vim-eco'
Plug 'alvan/vim-closetag'
Plug 'rust-lang/rust.vim'
Plug 'mileszs/ack.vim'
" grep
" Colorschemes

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

"  scrooloose/nerdtree
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeDirArrows = 0
let NERDTreeShowHidden=1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', '\.bundle$']
map <Leader>n :NERDTreeTabsToggle<CR>

"  jistr/vim-nerdtree-tabs
let g:nerdtree_tabs_autoclose=1

" ============================
" ^ GENERAL PLUGINS SETTINGS ^
" ============================

filetype plugin indent on

" closetag
let g:closetag_filenames = "*.html,*.haml,*.hamlc,*.jst,*.jst.eco,*.slim, *.erb, *.pdf"

autocmd FileType ruby nmap <buffer> <C-b> <Plug>(seeing-is-believing-mark-and-run)
autocmd FileType ruby xmap <buffer> <C-b> <Plug>(seeing-is-believing-mark-and-run)

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

" GTags
let g:gen_tags#gtags_default_map = 1

" No highlight
nmap <silent> <C-I> :noh<cr>

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = '\.git$'
map <C-T> :CtrlPBuffer<CR>

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
nmap <leader>h <Esc>:NERDTreeTabsToggle<CR>

autocmd QuickFixCmdPost *grep* cwindow
au BufRead,BufNewFile *.hamlc set filetype=haml
au BufRead,BufNewFile *.rabl set filetype=ruby

"markdown
nmap <silent> <F8> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview
