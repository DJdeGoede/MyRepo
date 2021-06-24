" Using https://github.com/junegunn/vim-plug plugin manager
call plug#begin('~/.local/share/nvim/plugged')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'cespare/vim-toml'
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/a.vim'
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" Search & display
set ignorecase
set incsearch
set nohls
set number
set showmatch
set smartcase

" Enable vim: ... directives
set modeline

" Tab stuff
set tabstop=8
set softtabstop=4
set shiftwidth=4

" Use system clipboard
set clipboard=unnamedplus

" Make no noise
set visualbell t_vb=
set noerrorbells

" Vertical diff
set diffopt=filler,vertical

" Use hidden (allow buffer switch when modified)
au BufNewFile,BufRead * set hidden

" Abbreviations
abb _3me_ Miki Tebeka <miki@353solutions.com>
abb _date_ <C-R>=strftime("%Y-%m-%d")<CR>
abb _gme_ Miki Tebeka <miki.tebeka@gmail.com>
abb _py_ #!/usr/bin/env python
abb _sh_ #!/bin/bash

" Make file executable
func! MakeExecutable()
    w
    !chmod +x %
    e
endfunc
comm! MX silent call MakeExecutable()

" Clean non ASCII characters
func! ASCII_Clean()
    silent %! iconv -c -t ASCII
endfunc
comm! AC call ASCII_Clean()

comm! Gr ! go run %
comm! Pr ! python %
comm! Pr2 ! python2 %

let g:ctrlp_custom_ignore = '.*venv/.*|vendor'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.venv$\|vendor$',
  \ }

" Go
au BufNewFile,BufRead *.go setl noet
au BufNewFile,BufRead *.go setl ts=4
au BufNewFile,BufRead *.go setl tw=0

" .envrc
au BufNewFile,BufRead .envrc set ft=zsh

let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
au FileType go nmap <leader>gt :GoDeclsDir<cr>

" Space for page up/down
noremap <SPACE> <C-F>

" Explorer to show full info
let g:explDetailedList=1

" Ale
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '❗'
let g:ale_linters = {
\   'python': ['flake8'],
\}

" Airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ctrlp#enabled = 1
let g:airline_theme = 'minimalist'
let g:airline_powerline_fonts = 1

" CTRL-P
noremap <C-P> :FZF<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.venv$\|\.vendor$',
  \ }

" Python
let g:python3_host_prog  = '/opt/miniconda3/bin/python'
let g:jedi#goto_command = "<C-]>"

func! Isort()
    w
    silent !isort -q %
    e
endfunc
comm! Isort call Isort()

" Run black Python formatter
func! Black()
    w
    silent !black -S -l 79 %
    e
endfunc
comm! Black call Black()

" NERDTree
let NERDTreeIgnore = ['\.py[co]$', '__pycache__']
comm! NT NERDTreeToggle
let g:NERDTreeWinSize = 18 

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


if has("gui_running")
    " No toolbar or menu
    set guioptions=aAce
    colorscheme koehler
    set guifont=Roboto\ Mono\ 18
endif
