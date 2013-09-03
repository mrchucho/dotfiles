set guioptions-=m " No Menu Bar
set guioptions-=T " Remove toolbar
set guioptions-=t " tear off menu
set guioptions+=c " :ex command instead of modal

set noballooneval
set lines=40 columns=84

" Theme
colorscheme vividchalk
" Override theme
set background=dark
set colorcolumn=80
hi ColorColumn guifg=#FFFFFF guibg=#2D2D2D
hi Normal guibg=Black guifg=White
hi Search guibg=Yellow guifg=Black
hi Cursor guibg=NONE guifg=NONE gui=reverse

" set guifont=Consolas\ Bold:h18 " DejaVu\ Sans\ Mono\ Bold
set guifont=Menlo\ Regular:h13

" Mappings for gvim
nnoremap <leader>sv :source $MYVIMRC<cr> :source $MYGVIMRC<cr>
