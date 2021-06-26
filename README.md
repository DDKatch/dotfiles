# Basic info to setup dotfiles [WIP]

## Font
Collection: Fixed Width
Family: Hack Nerd Font Mono
Typeface: Regular

Installation details here:
- https://github.com/ryanoasis/nerd-fonts

## Neovim
#### Installation
I use nigtly builds(version ~> 0.5.0) which allows to use lua plugins

Steps:
- brew install --HEAD neovim

#### Run these commands to install CoC Lsp for particular languages:
- ruby 
	:CocInstall coc-solargraph
- javascript/typesctipt
	:CocInstall coc-tsserver

#### Install plugins
:PlugInstall

#### Preview markdown files
:MarkdownPreview
