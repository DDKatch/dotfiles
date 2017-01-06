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
"set clipboard+=unnamedplus
vmap <C-c> "+y
nnoremap <C-j> :bprevious<CR>
nnoremap <C-k> :bnext<CR>
nnoremap <C-left> :vertical resize +3<cr>
nnoremap <C-down> :resize +3<cr>
nnoremap <C-up> :resize -3<cr>
nnoremap <C-right> :vertical resize -3<cr>

" set clipboard=unnamedplus

" Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/Vimball'
Plugin 'vim-scripts/tComment'
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
" Ruby and Rails
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ngmy/vim-rubocop'
"
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/syntastic'
Plugin 'hwartig/vim-seeing-is-believing'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'kien/ctrlp.vim'
Plugin 'slim-template/vim-slim'
Plugin 'danro/rename.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'AndrewRadev/vim-eco'
Plugin 'alvan/vim-closetag'
Plugin 'rust-lang/rust.vim'
" Colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'Solarized'
Plugin 'ColorSchemeMenuMaker'
Plugin 'desert-warm-256'
Plugin 'darkspectrum'
Plugin 'tomasr/molokai'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'croaker/mustang-vim'

call vundle#end()
filetype plugin indent on

set t_Co=256
colorscheme mustang

" fonts airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" closetag
let g:closetag_filenames = "*.html,*.haml,*.hamlc,*.jst,*.jst.eco,*.slim"

" autocomplete
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

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
let g:NERDTreeWinSize = 33
let g:NERDTreeDirArrows = 0
let NERDTreeShowHidden=1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', '\.bundle$']
map <Leader>n :NERDTreeTabsToggle<CR>

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
nmap <leader>h <Esc>:NERDTreeTabsToggle<CR>

autocmd QuickFixCmdPost *grep* cwindow
au BufRead,BufNewFile *.hamlc set filetype=haml
au BufRead,BufNewFile *.rabl set filetype=ruby
highlight DiffAdd    cterm=bold ctermfg=15 ctermbg=22 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=15 ctermbg=88 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=15 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=15 ctermbg=8 gui=none guifg=bg guibg=Red
