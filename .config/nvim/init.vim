set nocompatible
filetype off

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ~/.config/nvim/init.vim
\| endif

call plug#begin('~/.config/nvim/plugged')
    "Editor addons
    Plug 'yggdroot/indentline'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    "Syntax
    Plug 'ekalinin/dockerfile.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'robbles/logstash.vim'
    Plug 'elixir-lang/vim-elixir'
    Plug 'andrewstuart/vim-kubernetes'
    Plug 's3rvac/vim-syntax-yara'
    Plug 'cespare/vim-toml'
    Plug 'zeek/vim-zeek'
call plug#end()

filetype plugin indent on
filetype plugin on
filetype indent on

set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cursorline

"Set filetype parameters
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.yar,*.yara setlocal filetype=yara

syntax on
set nu
set visualbell

set listchars=tab:>-,trail:-
set list

set backspace=indent,eol,start

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left':   [   [ 'mode', 'paste' ],
      \                 [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right':  [   [ 'lineinfo' ],
      \                 [ 'percent' ],
      \                 [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }
