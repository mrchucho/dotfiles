" To reload vimrc - :so %
" OR                :so $MYVIMRC

" Load all plugins from bundles
call pathogen#infect()

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
set grepprg=ack\ -k\ -C3
set grepformat=%f:%l:%m
set backspace=indent,eol,start
set ignorecase
set smartcase " don't ignore case if search has mixed case
set diffopt=vertical
set nomodeline
set cryptmethod=blowfish
set noequalalways
" Something is setting path, so path+= doesn't seem to work very well...
set path=.

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
autocmd FileType jsp,html,xml setlocal textwidth=0
autocmd FileType java setlocal makeprg=ant\ -emacs
autocmd FileType ebuild setlocal noexpandtab textwidth=80
autocmd FileType javascript setlocal nocindent
autocmd Filetype gitcommit setlocal tw=68 spell
autocmd Filetype cucumber setlocal tw=0 formatoptions= spell
autocmd BufNewFile,BufRead *.csv setlocal filetype=csv textwidth=0 formatoptions=
autocmd BufNewFile,BufRead *.pp setlocal filetype=puppet textwidth=0
autocmd BufNewFile,BufRead *.ru setlocal filetype=ruby
autocmd BufNewFile,BufRead *.go setlocal syntax=go noexpandtab smarttab sts=8 sw=4 ts=4
autocmd BufNewFile,BufRead *.py,*.pyw setlocal expandtab sw=4
autocmd BufNewFile,BufRead .passwords setlocal incsearch hlsearch
autocmd BufNewFile,BufRead TODO setlocal comments= formatoptions-=c formatlistpat=^\\s*[0-9√*>+]\\+[\\]:.)}\\t\ ]\\s*
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" Custom Commands
command! -nargs=* Help :vert help <args>
command! -nargs=0 Wrap set wrap linebreak nolist

" Mappings
" Leader key is \
" nmap: normal mode, vmap: visual mode, imap: insert mode
" *noremap: don't recursively map
vnoremap <leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader><space> :noh<cr>
nnoremap <leader>q gqip
vnoremap <leader>q gqi
nnoremap <leader>o :only<cr>
nnoremap <leader>s :setlocal spell! spelllang=en_us<cr>
" map <F5> :.Rake<CR>
" map <F1> :Help<CR>
nnoremap / /\v
vnoremap / /\v
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" symbolize string
nnoremap <leader>S Br:$xB
" search for current visual selection
vnoremap <leader>* yq/p<cr>

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
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
