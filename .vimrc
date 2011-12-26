set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab
filetype on
syntax enable
colorscheme zellner

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

