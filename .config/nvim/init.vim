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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Mofiqul/adwaita.nvim'

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" colorscheme onehalfdark
colorscheme seoul256-light
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
set autoindent
set nostartofline
set cursorline
set noswapfile
set nowrap
set confirm
set visualbell
set laststatus=2
set number
set expandtab
set notimeout ttimeout ttimeoutlen=200
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set backspace=indent,eol,start
set statusline+=%F%m
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*  " Windows

set shiftwidth=2
set softtabstop=2
" this doesn't work... WHY
autocmd FileType typescript setlocal ts=2 sts=2 sw=2

" use "+y to yank selection to system clipboard
" xclip must be installed when using X11
" set clipboard+=unnamedplus " does not work on WSL2

if has('mouse')
  set mouse=a
endif


" general key mappings
let mapleader = "," " map leader to comma
inoremap jj <Esc>
nmap ss :w<CR>
nmap qq :q<CR>

" NERDTree mappings
map tt :NERDTreeToggle<CR>
map tf :NERDTreeFocus<CR>
map tr :NERDTreeFind<CR>

" NERDCommenter
map <leader>, <plug>NERDCommenterToggle

" vimspector
map <F4> <plug>VimspectorStop
map <F5> <plug>VimspectorContinue
map <F6> <plug>VimspectorUpFrame
map <F7> <plug>VimspectorDownFrame
map <F8> <plug>VimspectorToggleBreakpoint
map <F9> <plug>VimspectorStepInto
map <F10> <plug>VimspectorStepOver
map <F11> <plug>VimspectorStepOut
map <F12> :VimspectorReset<CR>

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
let g:NERDTreeWinSize=40

" vimspector settings
let g:vimspector_install_gadgets = ['debugpy', 'vscode-cpptools']


" ctrlp settings
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|node_modules\|log\|tmp$\|dist',
\ 'file': '\.pyc$\|\.d\.ts$'
\ }

" **************** coc settings here to the end ****************
let g:coc_global_extensions=['coc-omnisharp', 'coc-tsserver', 'coc-json']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

try
  nmap <silent> [c :call CocAction('diagnosticNext')<cr>
  nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>
endtry
