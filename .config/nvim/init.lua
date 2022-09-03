local keymap_opts = { noremap = true, silent = true }


------------------- PLUGINS --------------------------

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'preservim/nerdtree'
  use 'preservim/nerdcommenter'
  use 'rking/ag.vim'
  use 'rafi/awesome-vim-colorschemes'
  use 'Mofiqul/adwaita.nvim'
  use 'dracula/vim'
  use 'Raimondi/delimitMate'
  use 'lambdalisue/battery.vim'
  use 'dense-analysis/ale'
  use 'nvim-treesitter/nvim-treesitter'
  use 'Furkanzmc/zettelkasten.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
end)

------------------- END PLUGINS ----------------------


vim.cmd("colorscheme onehalflight")
vim.cmd('let mapleader = ","')

require('Comment').setup()


------------------- EDITOR SETTINGS ------------------

vim.opt.hidden = true
vim.opt.hidden = true
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.ruler = true
vim.opt.autoindent = true
vim.opt.startofline = false
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.confirm = true
vim.opt.visualbell = true
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.showmatch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.updatetime = 300
vim.opt.backspace = 'indent,eol,start'
vim.opt.pastetoggle = '<F3>'
vim.opt.signcolumn = 'number'
vim.opt.encoding = 'utf-8'
-- vim.opt.nofoldenable = true
vim.opt.foldlevel = 99
vim.opt_local.foldmethod = 'indent'
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10
vim.opt.sw = 2
vim.opt.sts = 2
vim.opt.ts = 2
-- vim.opt.wildignore += "*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*"
vim.opt.mouse = 'a'

vim.cmd([[
  " custom commands
  command! RefreshConfig source $MYVIMRC

  " NERDTree settings
  let NERDTreeShowHidden=1
  let g:NERDTreeShowBookmarks=1
  let g:NERDSpaceDelims=1
  let g:NERDDefaultAlign='left'
  let g:NERDTreeWinSize=35

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

  " ale settings
  let g:ale_disable_lsp = 1
]])
------------------- END EDITOR SETTINGS ------------------

------------------- KEY MAPPINGS ---------------------

vim.api.nvim_set_keymap('n', '<Leader>json=', ":%!python3 -m json.tool<CR>", keymap_opts)
vim.api.nvim_set_keymap('n', '<C-n>', ':vnew<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<A-n>', ':new<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><left>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><down>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><up>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><right>', keymap_opts)
vim.api.nvim_set_keymap('n', '<left>', '<C-w><left>', keymap_opts)
vim.api.nvim_set_keymap('n', '<down>', '<C-w><down>', keymap_opts)
vim.api.nvim_set_keymap('n', '<up>', '<C-w><up>', keymap_opts)
vim.api.nvim_set_keymap('n', '<right>', '<C-w><right>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-[>', ':bprevious<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<C-]>', ':bnext<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F5>', ':edit<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F7>', ':buffers!<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F8>', ':messages<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F6>', ':registers<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F9>', ':NERDTreeToggle<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F10>', ':Telescope file_browser<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>Telescope lsp_definitions<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', 'Q', ':q<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', 'W', ':wa<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>1', ':colorscheme onehalflight<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>2', ':colorscheme seoul256-light<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>3', ':colorscheme seoul256<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>4', ':colorscheme adwaita<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>5', ':colorscheme onehalfdark<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>6', ':colorscheme dracula<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>0', ':colorscheme desert<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>ev', ':edit $MYVIMRC<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader><F5>', ':RefreshConfig<CR>', { noremap = true, silent = false })
-- vim.api.nvim_set_keymap('n', '<leader>,', '<cmd>NERDCommenterToggle<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>,', 'gcc', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', keymap_opts)
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', keymap_opts)
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', keymap_opts)
vim.api.nvim_set_keymap('i', 'jk', '<Esc>:w<CR>', keymap_opts)
vim.api.nvim_set_keymap('v', '<leader>,', 'gc', { silent = true })

------------------- END KEY MAPPINGS -----------------


------------------- LSP CONFIG -----------------------

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, keymap_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, keymap_opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lspconfig = require('lspconfig')
local lsp_flags = { debounce_text_changes = 50 }

lspconfig.pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig.sumneko_lua.setup {}

lspconfig.ccls.setup {
  on_attach = on_attach,
  flags = lsp_flags
}

------------------- END LSP CONFIG -------------------

------------------- LUALINE CONFIG -------------------

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '🍕', right = '🌊' },
    section_separators = { left = '💥', right = '🍣' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = false,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

------------------- END LUALINE CONFIG ---------------

------------------- TELESCOPE CONFIG -----------------

local telescope = require('telescope')

telescope.setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

telescope.load_extension 'file_browser'

------------------- END TELESCOPE CONFIG -------------

