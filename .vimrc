set number
set guifont=FiraCode-Regular
set tabstop=4 shiftwidth=4 expandtab
runtime! ftplugin/man.vim

call plug#begin()

" Theme
Plug 'morhetz/gruvbox'
set background=dark " Setting dark mode

Plug 'prabirshrestha/vim-lsp'

call plug#end()

if exists(':Plug')
    autocmd vimenter * ++nested colorscheme gruvbox
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

if executable('ccls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ccls',
        \ 'cmd': {server_info->['ccls']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
        \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
        \ 'allowlist': ['c', 'cpp', 'cc', 'cxx', 'h', 'hpp', 'hxx', 'hh'],
        \ })
endif

" Key bindings for vim-lsp
nn <silent> <M-d> :LspDefinition<cr>
nn <silent> <M-r> :LspReferences<cr>
nn <f2> :LspRename<cr>
nn <silent> <M-a> :LspWorkspaceSymbol<cr>
nn <silent> <M-l> :LspDocumentSymbol<cr>
