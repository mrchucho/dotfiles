" General
set nocompatible
set autowrite
filetype on
filetype plugin on
filetype indent on
set wildignore+=*/CVS*
set wildmode=list:longest
set grepprg=ack
set grepformat=%f:%l:%m
set backspace=indent,eol,start
set ignorecase
set smartcase " don't ignore case if search has mixed case

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
set sts=2
set sw=2
set ts=4
set expandtab
set nosmarttab
set nowrap
command! -nargs=* Wrap set wrap linebreak nolist
set invlist
set listchars=tab:▸\ ,eol:¬,trail:•,extends:…
set showbreak=…
" Text Formatting - Line-wrapping (NOTE to reformat paragraph: gqip)
set textwidth=80
" set formatoptions=tcnq " auto-wrap text/comments w/ tw, allow format with gq

" Filetypes & Auto Commands
autocmd FileType jsp,html,xml set textwidth=0
autocmd FileType java set makeprg=ant\ -emacs
autocmd FileType ebuild set noexpandtab textwidth=80
" Is this messing up javascript???
autocmd FileType javascript setlocal nocindent
autocmd Filetype gitcommit set tw=68 spell
autocmd Filetype cucumber set textwidth=80 formatoptions=tcanqw
autocmd BufNewFile,BufRead *.pp set filetype=puppet
autocmd BufNewFile,BufRead *.ru set filetype=ruby
autocmd BufNewFile,BufRead *.go set syntax=go noexpandtab smarttab sts=8 sw=4 ts=4
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" Mappings
vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
"   Navigate Display lines by hold Command
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^
map <F5> :.Rake<CR>

" Load all plugins from bundles
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
