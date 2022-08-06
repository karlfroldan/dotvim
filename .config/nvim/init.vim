set number tabstop=4 shiftwidth=4 expandtab

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins
Plug 'morhetz/gruvbox'

call plug#end()

autocmd vimenter * ++nested colorscheme gruvbox
