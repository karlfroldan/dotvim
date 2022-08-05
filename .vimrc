set number
set guifont=FiraCode-Regular
set tabstop=4 shiftwidth=4 expandtab
runtime! ftplugin/man.vim

call plug#begin()

" Theme
Plug 'morhetz/gruvbox'
set background=dark " Setting dark mode

call plug#end()

if exists(':Plug')
    autocmd vimenter * ++nested colorscheme gruvbox
endif
