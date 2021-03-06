set number
set cursorline
set laststatus=2
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cindent
set nobackup
set autoread
set ruler
set ignorecase
set t_Co=256
set termguicolors
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
syntax on
filetype off
filetype plugin indent on
let mapleader=","


" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-commentary'
Plugin 'altercation/vim-colors-solarized'
Plugin 'whatyouhide/vim-gotham'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'dracula/vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()

set background=dark
colorscheme palenight
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

" space-vim-dark theme
" hi Comment cterm=italic

" solarized-theme
" set background=dark

" molokai theme
" let g:rehash256=1

" palenight theme
let g:palenight_terminal_italics=1

" YouCompleteMe
let g:ycm_server_python_interpreter='/usr/bin/python2'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" NERDTree
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" map a specific key or shortcut to open NERDTree
map <F2> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline and Airline-theme
let g:airline_theme='violet'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" tmuxline
let g:tmuxline_powerline_separators = 1

" Clang-format
let g:clang_format#code_style='llvm'
" map to <Leader>cf in C++ code
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
let g:clang_format#style_options = {
            \ "PointerAlignment" : "true",
            \ "AlignConsecutiveDeclarations" : "true",
            \ "AlignConsecutiveAssignments" : "true",
            \ "AllowShortFunctionsOnASingleLine" : "All",
            \ "AllowShortBlocksOnASingleLine" : "true",
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AllowShortLoopsOnASingleLine" : "true",
            \ "Standard" : "C++11"}

" vim-commentary
autocmd FileType python,shell set commentstring=##\ %s

" delimitmate
let delimitMate_matchpairs = "(:),[:],{:}"
imap <C-k> <Plug>delimitMateS-Tab
