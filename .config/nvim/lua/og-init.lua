function og_vim_init()

  -- plugins
  vim.cmd([[
    call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    " Plug 'tpope/vim-fugitive'
    Plug 'rking/ag.vim'
    " Plug 'puremourning/vimspector'
    " Plug 'vim-ruby/vim-ruby'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'kien/ctrlp.vim'
    Plug 'Mofiqul/adwaita.nvim'
    Plug 'dracula/vim'
    Plug 'Raimondi/delimitMate'
    " Plug 'OmniSharp/omnisharp-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lambdalisue/battery.vim'
    Plug 'dense-analysis/ale'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'neovim/nvim-lspconfig'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Plug 'kyazdani42/nvim-web-devicons'
    " Plug 'folke/trouble.nvim'
    " Plug 'nvim-lua/plenary.nvim'
    " Plug 'nvim-telescope/telescope.nvim'

    " ddc insanity
    " Plug 'vim-denops/denops.vim'
    " Plug 'Shougo/ddc.vim'
    " Plug 'Shougo/pum.vim'
    " Plug 'Shougo/ddc-omni'
    " Plug 'Shougo/ddc-around'
    " Plug 'Shougo/ddc-matcher_head'
    " Plug 'Shougo/ddc-sorter_rank'
    " Plug 'Shougo/ddc-nvim-lsp'
    " Plug 'tani/ddc-fuzzy'
    " Plug 'tani/ddc-path'
    " Plug 'statiolake/ddc-ale'
    " Plug 'delphinus/ddc-treesitter'
    " Plug 'nabezokodaikon/ddc-nvim-lsp_by-treesitter'
    call plug#end()
  ]])

  -- default colorscheme
  vim.cmd("colorscheme dracula")

  -- editor settings
  vim.cmd([[
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
    set splitright
    set splitbelow
    set updatetime=300
    set backspace=indent,eol,start
    set statusline=%F%m
    set statusline+=%#warningmsg#
    set statusline+=%*
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*  " Windows
    set pastetoggle=<F3>
    set signcolumn=number
    set encoding=utf-8

    " https://essais.co/better-folding-in-neovim/
    setlocal foldmethod=indent
    set nofoldenable
    set foldlevel=99

    " make esc FAST!
    " https://vi.stackexchange.com/a/20220
    set notimeout ttimeout ttimeoutlen=10

    set sw=2 sts=2 ts=2 et
    " this doesn't work... WHY
    " autocmd FileType typescript setlocal ts=2 sts=2 sw=2

    " use "+y to yank selection to system clipboard
    " xclip must be installed when using X11
    " set clipboard+=unnamedplus " does not work on WSL2

    " remove background for compositor sexiness
    hi Normal guibg=NONE ctermbg=NONE

    if has('mouse')
      set mouse=a
    endif
  ]])

  -- commands and mappings
  vim.cmd([[
    " custom commands
    command! RefreshConfig source $MYVIMRC

    " general key mappings
    let mapleader = ","

    inoremap jj <Esc>
    inoremap jk <Esc>:w<CR>
    nnoremap W :wa<CR>
    nnoremap Q :q<CR>
    nnoremap <F5> :e<CR>
    inoremap <A-BS> <ESC>dF<SPACE>a

    " yank to system clipboard
    xnoremap <c-c> "+y

    " colorscheme favs!
    nnoremap <leader>1 :colorscheme seoul256-light<CR>
    nnoremap <leader>2 :colorscheme seoul256<CR>
    nnoremap <leader>3 :colorscheme desert<CR>
    nnoremap <leader>4 :colorscheme adwaita<CR>
    nnoremap <leader>5 :colorscheme onehalfdark<CR>
    nnoremap <leader>6 :colorscheme dracula<CR>
    nnoremap <leader>7 :colorscheme onehalflight<CR>

    " TODO
    function! BackgroundToggle()
    if &background
      set background=light
      echom "Set background to light."
    else
      set background=dark
      echom "Set background to dark."
      endif
    endfunction

    nnoremap <leader>b :call BackgroundToggle()<cr>

    nnoremap <leader>ev :edit $MYVIMRC<CR>
    nnoremap <leader><F5> :RefreshConfig<CR>
    nnoremap <leader>h :noh<CR>
    nnoremap <leader>w :w<CR>
    nnoremap <leader>q :q<CR>

    " vim/toggly things.
    nnoremap <leader><F1> :set wrap!<CR>

    " navigate split windows, vim-style
    nnoremap <leader>a <C-w>h
    nnoremap <leader>s <C-w>j
    nnoremap <leader>d <C-w>k
    nnoremap <leader>f <C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l

    " tmux-style window splitting
    nnoremap <A-'> :vsp<CR>
    nnoremap <A-5> :sp<CR>

    " NERDTree mappings
    nnoremap <leader>tt :NERDTreeToggle<CR>
    nnoremap <leader>tf :NERDTreeFocus<CR>
    nnoremap <leader>tr :NERDTreeFind<CR>

    " Find files using Telescope command-line sugar.
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>gf <cmd>Telescope git_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

    " trouble
    nnoremap <leader>xx <cmd>TroubleToggle<cr>
    nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
    nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
    nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
    nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
    nnoremap gR <cmd>TroubleToggle lsp_references<cr>

    " NERDCommenter
    map <leader>, <plug>NERDCommenterToggle

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
  ]])

  -- plugin settings and configuration
  vim.cmd([[
    " NERDTree settings
    let NERDTreeShowHidden=1
    let g:NERDTreeShowBookmarks=1
    let g:NERDSpaceDelims=1
    let g:NERDDefaultAlign='left'
    let g:NERDTreeWinSize=35

    "NERDCommenter settings
    let g:NERDCommentEmptyLines=1

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

    " airline settings
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline_symbols.linenr = '∥'
    let g:airline_symbols.colnr = '∥'
    let g:airline_symbols.maxlinenr = ''
    let g:airline#extensions#ale#enabled = 1
    let airline#extensions#ale#error_symbol = 'E:'
    let airline#extensions#ale#warning_symbol = 'W:'
    let airline#extensions#ale#show_line_numbers = 1
    let airline#extensions#ale#open_lnum_symbol = '(L'
    let airline#extensions#ale#close_lnum_symbol = ')'
    let g:airline#extensions#battery#enabled = 1
    let g:battery#update_tabline = 1
    let g:airline#extensions#nerdtree_statusline = 1
    let g:airline#extensions#syntastic#enabled = 1
    let g:airline#extensions#whitespace#symbol = '!!!'

    " ale settings
    let g:ale_disable_lsp = 1
  ]])

  -- vim.cmd("source ~/dotfiles/.config/nvim/ddc.vim")

  return
end
