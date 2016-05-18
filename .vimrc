"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
set expandtab
syntax enable
set hidden
set nocompatible
colorscheme zellner

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

" Pathogen bundler
call pathogen#infect()

" NERDTree key
noremap <C-t> :tabnew<CR>:NERDTree<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-N> :tabnew<CR>

" VimClojure
syntax on
filetype plugin indent on

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


