" To reload vimrc - :so %

" Load all plugins from bundles
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Use the system clipboard & vim clipboard interchangeably
set clipboard=autoselect " unnamed

" General
set nocompatible
set autowrite
filetype on
filetype plugin on
filetype indent on
set wildignore+=*/CVS*
set wildmode=list:longest
set grepprg=ack\ -k
set grepformat=%f:%l:%m
set backspace=indent,eol,start
set ignorecase
set smartcase " don't ignore case if search has mixed case
set diffopt=vertical
set nomodeline
set cryptmethod=blowfish
set noequalalways

" Color / Themes
colorscheme vividchalk " desert
syntax on
set hlsearch
set mousehide
set background=dark

" UI
set number
set vb t_vb=
set showmatch
set colorcolumn=80
hi ColorColumn ctermbg=LightGray ctermfg=Black guibg=#2D2D2D guifg=#FFFFFF
hi LineNr ctermbg=DarkGray ctermfg=LightGray guibg=#2D2D2D guifg=#FFFFFF
hi Normal guibg=Black guifg=White
hi Search cterm=bold ctermbg=Yellow ctermfg=Black

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
set invlist
set listchars=tab:▸\ ,eol:¬,trail:•,extends:…
set showbreak=…
" Text Formatting - Line-wrapping
" NOTE: to reformat paragraph: gqip
" NOTE: to reformat selection: gq
set textwidth=80
" auto-wrap text/comments w/ tw; recognize number lists; allow format with gq;
" remove comment leaders when joining lines
set formatoptions+=tcnqj

" Filetypes & Auto Commands
autocmd FileType jsp,html,xml set textwidth=0
autocmd FileType java set makeprg=ant\ -emacs
autocmd FileType ebuild set noexpandtab textwidth=80
autocmd FileType javascript setlocal nocindent
autocmd Filetype gitcommit set tw=68 spell
autocmd Filetype cucumber set textwidth=80 formatoptions=tcanqw
autocmd BufNewFile,BufRead *.csv set filetype=csv textwidth=0 formatoptions=
autocmd BufNewFile,BufRead *.pp set filetype=puppet
autocmd BufNewFile,BufRead *.ru set filetype=ruby
autocmd BufNewFile,BufRead *.go set syntax=go noexpandtab smarttab sts=8 sw=4 ts=4
autocmd BufNewFile,BufRead *.py,*.pyw set expandtab sw=4
autocmd BufNewFile,BufRead .passwords set incsearch hlsearch
autocmd BufNewFile,BufRead TODO set comments= formatoptions-=c formatlistpat=^\\s*[0-9√*>+]\\+[\\]:.)}\\t\ ]\\s*
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" Custom Commands
command! -nargs=* Help :vert help <args>
command! -nargs=0 Wrap set wrap linebreak nolist

" Mappings
" Leader key is \
vmap <leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader><space> :noh<cr>
nnoremap <leader>q gqip
vmap <leader>q gqi
nnoremap <leader>o :only<cr>
nnoremap <leader>s :setlocal spell! spelllang=en_us<cr>

map <F5> :.Rake<CR>
map <F1> :Help<CR>
nnoremap / /\v
vnoremap / /\v

" Abbreviations
ab guarnator guarantor
ab Guarnator Guarantor
ab supress suppress
ab Supress Suppress
ab unsupress unsuppress
ab Unsupress Unsuppress
ab speciality specialty
ab specialities specialties
ab Specialities Specialties
ab Speciality Specialty

" netrw
let g:netrw_list_hide='.*\.swp$'
