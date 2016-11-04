" ---------------------------------------------------------------------------------------
" @dencold .vimrc file
"
" props to Doug Black for his wonderfully helpful guide
" http://dougblack.io/words/a-good-vimrc.html
"
" a note on mapping:
" - map (aka remap) is the default root and remaps REcursively
" - noremap is the root of all non-recursive mappings
" Prepending a mode letter specifies where the mapping occurs:
" - n: normal only
" - v: visual and select
" - o: operator-pending
" - x: visual only
" - s: select only
" - i: insert
" - c: command-line
" - l: insert, command-line, regexp-search (and others. Collectively called 'Lang-Arg' pseudo-mode)
"

"-- General Settings --
syntax enable   " enables syntax highlighting
execute pathogen#infect()
syntax on
filetype plugin indent on

" highlight last inserted text
nnoremap gV `[v`] 

" save session
nnoremap <leader>s :mksession<CR>

"-- Spacing/UI --
set tabstop=4     " set 4 spaces per tab
set softtabstop=4 " set 4 visual spaces per tab
set expandtab     " tabs become spaces
set number        " gives us line numbers on side
set showcmd       " shows us the last command at bottom
set cursorline    " highlights the current line
set wildmenu      " command menu autocomplete
set lazyredraw    " laissez-faire redraw
set showmatch     " match brackets/parens/etc.
set laststatus=2  " required for airplane plugin

"-- Clipboard --
" allows vim to use the system clipboard for default register
set clipboard=unnamedplus

"-- Search --
set incsearch     " search as text is entered
set hlsearch      " highlight
nnoremap <leader><space> :nohlsearch<CR>

"-- Movement --
" disable arrow-keys! (help learn hjkl movement)
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" line beginning/end mapped to B & E 
nnoremap B ^
nnoremap E $

"-- Leader Shortcuts --

" '\' is a little too far away, remap to ','
let mapleader=" "

" ESC is a little too far away, remap to jk
inoremap jk <esc>

"-- Extension Settings --

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" open ag.vim
nnoremap <leader>a :Ag

" CtrlP settings
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>j :CtrlPMRU<CR>
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.so$',
  \ }

" neocomplete settings
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" vim-go settings
let g:go_auto_type_info = 1 " show the type info for the word under the cursor
let g:go_fmt_command = "goimports" " format with goimports instead of gofmt

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"-- Color Scheme --
colorscheme spacegray

"-- Backups --
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

