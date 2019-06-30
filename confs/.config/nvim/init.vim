call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/lightline.vim' "status bar / tabs

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
"Plug 'rhysd/git-messenger.vim'

Plug 'neomake/neomake'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'tpope/vim-obsession'

Plug 'rafi/awesome-vim-colorschemes'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'dln/avro-vim'

Plug 'kchmck/vim-coffee-script'
Plug 'noc7c9/vim-iced-coffee-script'
Plug 'lchi/vim-toffee'

Plug 'Yggdroot/indentLine'

call plug#end()

let mapleader="`"

"" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent

autocmd Filetype go setlocal ts=4 sts=4 sw=4 expandtab

filetype on
filetype plugin on
filetype indent on

set autowrite
set mouse=a
set undofile
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete

" performance
set lazyredraw

" key binding: Ctrl-N for moving cursor in auto-complete list
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

set ttimeout
set ttimeoutlen=0
set matchtime=0

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" CtrlP -> FZF
nnoremap <c-p> :FZF<cr>

" Visual
syntax on
set number
set colorcolumn=80
set showmatch
set ruler
set laststatus=2
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Visual: indentline
let g:indentLine_color_term = 239

" Visual: theme
set background=dark
colorscheme hybrid_material

" Visual: vim-indent-guides
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=235
"hi IndentGuidesEven ctermbg=234

" echodoc
set noshowmode
set cmdheight=2

" vim-go
" let g:go_fmt_command = "goimports"
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_interfaces = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
" let g:go_auto_type_info=0
" au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gb <Plug>(go-build)
" au FileType go nmap <Leader>gt <Plug>(go-test)

" syntastic for Go
" let g:syntastic_go_checkers = ['go', 'errcheck', 'golint', 'govet']
" let g:syntastic_go_checkers = ['errcheck', 'golint', 'govet']
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['go'] }

" syntastic for python
let g:syntastic_python_checkers = ['qlint']

" neomake
autocmd! BufWritePost * Neomake
let g:neomake_go_enabled_makers = ['go', 'golint', 'govet']
let g:neomake_error_sign = {'text': 'E>', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': 'W>', 'texthl': 'NeomakeWarningSign'}
let g:neomake_info_sign = {'text': 'i>', 'texthl': 'NeomakeInfoSign'}
let g:neomake_message_sign = {'text': 'm>', 'texthl': 'NeomakeMessageSign'}

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc
let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier', 'coc-css']
" Use K to show documentation in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>

" gitgutter
noremap <C-g> :GitGutterLineHighlightsToggle<CR>
let g:gitgutter_diff_args = '-w'

" Dash
:nmap <silent> <leader>d <Plug>DashSearch

" NERD Tree
noremap <F3> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 'x'
let g:NERDTreeMapOpenVSplit = 'v'

" TagBar
nmap <silent> <F4> :TagbarToggle<CR>

" CtrlP -> FZF
nnoremap <c-p> :FZF<cr>

" neovim Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" *.avdl
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl

" ack.vim
if executable('ag')
  let g:ackprg = 'ag' " --vimgrep'
endif

" key bindings: Shift-H and Shift-L for navigating tabs; Ctrl-t for new tab
nnoremap H gT
nnoremap L gt
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap <C-q>     :Ttoggle<CR>


nnoremap <ScrollWheelUp> <C-Y>
nnoremap <ScrollWheelDown> <C-E>
nnoremap <M-k> <C-y><C-y><C-y><C-y>
nnoremap <M-j> <C-e><C-e><C-e><C-e>
