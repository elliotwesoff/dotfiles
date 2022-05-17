call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'vim-syntastic/syntastic'
Plug 'puremourning/vimspector'
Plug 'vim-ruby/vim-ruby'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'Mofiqul/adwaita.nvim'
Plug 'dracula/vim'
Plug 'Raimondi/delimitMate'

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" colorscheme onehalfdark
colorscheme seoul256
" let g:adwaita_mode = "light"
" colorscheme adwaita

" colorscheme modifications
" hi Normal guibg=NONE ctermbg=NONE
hi Search guibg=wheat guifg=DarkSlateGray


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
set cmdheight=1
set updatetime=300
set backspace=indent,eol,start
set statusline+=%F%m
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*  " Windows
set pastetoggle=<F3>


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
autocmd FileType typescript setlocal ts=2 sts=2 sw=2

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

" tmux-style window splitting
nnoremap <leader>5 :vsp<CR>
nnoremap <leader>' :sp<CR>

" NERDTree mappings
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFocus<CR>
nnoremap <leader>tr :NERDTreeFind<CR>

" NERDCommenter
map <leader>, <plug>NERDCommenterToggle

" normal mode mappings
nnoremap <c-u> <esc>viw U <esc>

" insert mode mappings
inoremap <c-u> <esc>viw U <esc>i

" vimspector
" map <F4> <plug>VimspectorStop
" map <F5> <plug>VimspectorContinue
" map <F6> <plug>VimspectorUpFrame
" map <F7> <plug>VimspectorDownFrame
" map <F8> <plug>VimspectorToggleBreakpoint
" map <F9> <plug>VimspectorStepInto
" map <F10> <plug>VimspectorStepOver
" map <F11> <plug>VimspectorStepOut
" map <F12> :VimspectorReset<CR>

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_c_include_dirs = ['lib']


" NERDTree settings
let NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
let g:NERDTreeWinSize=50

" vimspector settings
let g:vimspector_install_gadgets = ['debugpy', 'vscode-cpptools']

" ctrlp settings
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|node_modules\|log\|tmp$\|dist',
\ 'file': '\.pyc$\|\.d\.ts$'
\ }

" nvim difftool configuration
if &diff
  highlight! link DiffText MatchParen
endif

" coc config is a lot, let's keep it in another file
source ~/dotfiles/.config/nvim/.coc-config.vim

