" General
set nocompatible
set autowrite
filetype plugin indent on
set wildignore+=*/CVS*
set wildmode=list:longest
set grepprg=ack
set grepformat=%f:%l:%m

" Color / Themes
syntax on
set hlsearch
set mousehide
set background=dark
colorscheme desert " vividchalk

" UI
set number
set vb t_vb=
set showmatch

" Status Line
set report=1
set laststatus=2 
hi User1 term=underline cterm=bold ctermfg=Cyan ctermbg=Blue guifg=#40ffff guibg=#0000aa
hi User2 term=underline cterm=bold ctermfg=Cyan ctermbg=Blue guifg=#40ffff guibg=#0000aa
set statusline=%f\ %m\ %h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ %12.(col:%c\ row:%l/%L%)

" Text Formatting
set autoindent
set smartindent 
set nowrap
set sts=2
set sw=2
set ts=4
set expandtab
set nosmarttab

" Filetypes & Auto Commands
autocmd FileType jsp,html,xml set textwidth=0
autocmd FileType java set makeprg=ant\ -emacs
autocmd FileType ebuild set noexpandtab textwidth=80
autocmd FileType javascript setlocal nocindent
autocmd Filetype gitcommit set tw=68 spell
autocmd BufNewFile,BufRead *.pp set filetype=puppet
autocmd BufNewFile,BufRead *.ru set filetype=ruby
autocmd BufNewFile,BufRead *.go set syntax=go noexpandtab smarttab sts=8 sw=4 ts=4
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif


" Mappings
vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
"map     {!}sort -b
map  h  1G
map  H  1G
map  F  G
map  V  
map  U  
"map  T  k
map  S  j
map  Q   i
map  P   x
map  L   O
"map  M   dd
map  K   D
map  J   DjdG$
map! A  ka
map! D  ha
map! C  la
map! B  ja
map! L  
map! Q  
map! R  
