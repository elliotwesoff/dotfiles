" YO!!!!!!!!!!!! this (n)vimrc only works on neovim!
" some of the plugins had `if ("nvim") ...` statements,
" but i removed them because once you go nvim you
" never go back! later!!!

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'puremourning/vimspector'
Plug 'vim-ruby/vim-ruby'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'Mofiqul/adwaita.nvim'
Plug 'dracula/vim'
Plug 'Raimondi/delimitMate'
Plug 'OmniSharp/omnisharp-vim'

" here is where things get weird.
" 1. ale provides real-time linting
Plug 'dense-analysis/ale'

" 2. tree-sitter is supposed to be a next-gen syntax tree parser,
"     aimed at analyzing your code: syntax highlighting, code jumping,
"     navigating through files via symbols, etc.
"     but, why would ddc, an autocompletion engine, integrate with
"     a syntax tree parser?
Plug 'nvim-treesitter/nvim-treesitter'

" 3. ddc is the dark deno powered autocomplete engine.
"     it should only provide autocompletion, but it allows
"     for many different ddc-adapted vim plugins to cooperate
"     with it?
Plug 'Shougo/ddc.vim'
Plug 'Shougo/pum.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'statiolake/ddc-ale'
Plug 'Shougo/ddc-nvim-lsp'
Plug 'delphinus/ddc-treesitter'
Plug 'tani/ddc-fuzzy'
Plug 'nabezokodaikon/ddc-nvim-lsp_by-treesitter'
" all of this seems like an extreme amount of effort to get vim
" to have all the features of a modern IDE. is there something
" more to this that i'm missing?

call plug#end()

colorscheme onehalfdark
" remove background for transparent terminals, but we ain't usin it now!
" hi Normal guibg=NONE ctermbg=NONE

set nocompatible
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set ruler
set noautoindent
set nostartofline
set cursorline
set noswapfile
set nowrap
set confirm
set visualbell
set laststatus=2
set number
set expandtab
set nobackup
set nowritebackup
set showmatch
set updatetime=300
set backspace=indent,eol,start
set statusline=%F%m
set statusline+=%#warningmsg#
set statusline+=%*
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*  " Windows
set pastetoggle=<F3>
set signcolumn=number

" https://essais.co/better-folding-in-neovim/
setlocal foldmethod=indent
set nofoldenable
set foldlevel=99

" make esc FAST!
" https://vi.stackexchange.com/a/20220
set notimeout ttimeout ttimeoutlen=10

" set shiftwidth=2
" set softtabstop=2
set sw=2 sts=2 ts=2 et
" this doesn't work... WHY
" autocmd FileType typescript setlocal ts=2 sts=2 sw=2

" use "+y to yank selection to system clipboard
" xclip must be installed when using X11
" set clipboard+=unnamedplus " does not work on WSL2

if has('mouse')
  set mouse=a
endif

" custom commands
command! RefreshConfig source $MYVIMRC

" general key mappings
let mapleader = ","
let maplocalleader = "\<space>"

inoremap jj <Esc>
inoremap jk <Esc>
nnoremap W :wa<CR>
nnoremap Q :qa<CR>
nnoremap <F5> :e<CR>

" yank to system clipboard
noremap <c-c> "+y

" colorscheme favs!
nnoremap <leader>c1 :colorscheme seoul256-light<CR>
nnoremap <leader>c2 :colorscheme seoul256<CR>
nnoremap <leader>c3 :colorscheme desert<CR>
nnoremap <leader>c4 :colorscheme adwaita<CR>
nnoremap <leader>c5 :colorscheme onehalfdark<CR>
nnoremap <leader>c6 :colorscheme dracula<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader><F5> :RefreshConfig<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" navigate split windows, vim-style
nnoremap <leader>a <C-w>h
nnoremap <leader>s <C-w>j
nnoremap <leader>d <C-w>k
nnoremap <leader>f <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tmux-style window splitting
nnoremap <leader>5 :vsp<CR>
nnoremap <leader>' :sp<CR>

" NERDTree mappings
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFocus<CR>
nnoremap <leader>tr :NERDTreeFind<CR>

" NERDCommenter
map <leader>, <plug>NERDCommenterToggle

" capitalze word with ctrl+U
nnoremap <c-u> <esc>viw U <esc>
inoremap <c-u> <esc>viw U <esc>i

" ALE! AAAAAAAAALE!!!!!!!!!
nnoremap <F4>     :ALEHover<CR>
nnoremap <F12>    :ALEGoToDefinition<CR>
nnoremap <A-F12>  :ALEFindReferences<CR>

" pum configuration
inoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>" 

" NERDTree settings
let NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
let g:NERDTreeWinSize=50

" nvim difftool configuration
if &diff
  highlight! link DiffText MatchParen
endif

" ctrlp settings
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|node_modules\|log\|tmp$\|dist',
\ 'file': '\.pyc$\|\.d\.ts$'
\ }

" ALE and autocompletion settings
let g:indent_guides_enable_on_vim_startup = 1
let g:deoplete#enable_at_startup = 1

source ~/dotfiles/.config/nvim/ddc.vim

