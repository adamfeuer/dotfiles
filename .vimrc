set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
syntax enable
set hidden
set nocompatible
"colorscheme zellner

" Python 2/3
if has('python')
  let g:jedi#force_py_version = 2
  let g:syntastic_python_python_exec = 'python2'
  let g:pymode_python = 'python2'
elseif has('python3')
  let g:jedi#force_py_version = 3
  let g:syntastic_python_python_exec = 'python3'
  let g:pymode_python = 'python3'
else
  let g:loaded_jedi = 1
endif

if $TERM == "xterm-256color"
          set t_Co=256
endif

" for files encrypted using ccrypt(1)
augroup CPT
  au!
  " decrypt before reading
  au BufReadPre *.cpt       set bin viminfo= noswapfile
  " decrypted; prepare for editing
  au BufReadPost *.cpt      let $VIMPASS = inputsecret("Password: ")
  au BufReadPost *.cpt      %!ccrypt -cb -E VIMPASS
  au BufReadPost *.cpt      set nobin

  " encrypt
  au BufWritePre *.cpt      set bin
  au BufWritePre *.cpt      %!ccrypt -e -E VIMPASS
  " encrypted; prepare for continuing to edit the file
  au BufWritePost *.cpt     silent undo | set nobin
augroup END

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'hylang/vim-hy'

" more Plugin commands
" ...
call vundle#end()            " required
filetype plugin indent on    " required

" NERDTree key
noremap <C-t> :tabnew<CR>:NERDTree<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-N> :tabnew<CR>

" Powerline settings
set encoding=utf-8
set t_Co=256 
let g:Powerline_symbols = 'fancy'
set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" golang
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOPATH/misc/vim
set runtimepath+=$HOME/.vimrc/after
filetype plugin indent on
syntax on


