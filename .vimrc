" make sure vim-plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source "~/.vimrc"
endif

set encoding=utf8
set mouse=a
" alert bell off
set belloff=all

" highlight cursor col and line
set cursorcolumn
set cursorline
highlight CursorLine cterm=NONE ctermbg=239 term=bold cterm=bold guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=239 term=bold cterm=bold guibg=NONE guifg=NONE

" cursor shape and blink
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

set nocompatible
set ts=4
" map leader to space
let mapleader = " "

" Provide tab-completion for all file-related tasks
set path+=**
" Display all matching files when enter tab to complete
set wildmenu

" hybrid number
set number relativenumber

" highlight search
set hlsearch
nnoremap <leader>/ :let @/=""<CR>

" 80 col indicator line
"set ColorColumn=81
call matchadd('ColorColumn', '\%81v', 100)

" Shady char
set listchars=tab:·\ ,trail:·
" set listchars=tab:>~,nbsp:_,trail:.
set list
" show cmd
set showcmd

" set 7 lines to the cursor - when moving vertically using j/k
set so=7

" do incremental searching
set incsearch

" keep 500 lines of command line history
set history=500

set autoindent
set cindent

" Plugins related are in below
" ------------------------------------------------------------------------------
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" for vim-commentary:
" change comment string for c cpp
autocmd FileType c,cpp set commentstring=//\ %s
" change comment string for R
autocmd FileType r set commentstring=#\ %s

" for ultisnips and vim-snippets:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=[$HOME.'.vim/plugged/vim-snippets/UltiSnips', $HOME.'.vim/plugged/vim-snippets/snippets',$HOME.'/dotfiles/mysnips/']
