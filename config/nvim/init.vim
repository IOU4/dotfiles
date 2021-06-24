syntax enable
set path+=**
set noerrorbells
set relativenumber
set nu
set hidden
set autoindent
set tabstop=3 softtabstop=3
set shiftwidth=3
set expandtab
set smartindent
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set whichwrap+=<,>,[,]
set noshowmode
set cmdheight=1
set laststatus=2
set so=6
set siso=20
set showcmd
set termguicolors "magic



call plug#begin()
Plug 'luochen1990/rainbow'
Plug 'AndrewRadev/tagalong.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'hoob3rt/lualine.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'Yggdroot/indentLine'

call plug#end()

" Set number & gitgutter colorscheme
highlight LineNr ctermfg=grey
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4
let g:gitgutter_enabled = 0

"gruvbox---------------------------
"colorscheme gruvbox
"set background=dark
"let g:gruvbox_italic=1
"let g:gruvbox_italicize_strings=1
"let g:gruvbox_contrast_dark = 'hard'

"tokyonight---------------
luafile ~/.config/nvim/config/tokyonight.lua

"lua---------------
luafile ~/.config/nvim/config/lsp-config.lua
luafile ~/.config/nvim/config/compe.lua
luafile ~/.config/nvim/config/tree-sitter.lua
luafile ~/.config/nvim/config/lualine.lua
"luafile ~/.config/nvim/config/galaxy-line.lua
luafile ~/.config/nvim/config/tree.lua


"remaps------
source ~/.config/nvim/config/general.vim




" If 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set rtp +=~/.config/nvim
