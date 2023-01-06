local M = {}

local function apply_global_settings()
  vim.cmd([[colorscheme rose-pine]])
  vim.g.mapleader = ","
  vim.g.vimtex_view_method = 'zathura'
  -- vim.g.ale_disable_lsp = 1
  -- vim.g.ale_linters = {
  --   ['python'] = {'pylint'},
  --   ['cpp'] = {'ccls'},
  --   ['c'] = {'ccls'}
  -- }
  vim.g.oh_lucy_italic_functions = true
  vim.g.oh_lucy_italic_comments = true
  vim.g.oh_lucy_evening_italic_functions = true
  vim.g.oh_lucy_evening_italic_comments = true
end

function M.apply_settings()
  apply_global_settings()
  vim.opt.hidden = true
  vim.opt.wildmenu = true
  vim.opt.showcmd = false
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
  vim.opt.numberwidth = 4
  vim.opt.expandtab = true
  vim.opt.backup = false
  vim.opt.writebackup = false
  vim.opt.showmatch = true
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  vim.opt.showmode = false
  vim.opt.updatetime = 300
  vim.opt.backspace = 'indent,eol,start'
  vim.opt.pastetoggle = '<F3>'
  vim.opt.signcolumn = 'auto'
  vim.opt.encoding = 'utf-8'
  vim.opt.ttimeout = true
  vim.opt.ttimeoutlen = 10
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = 2
  vim.opt.tabstop = 2
  vim.opt.mouse = 'a'
  vim.opt.cmdheight = 0
  vim.opt.termguicolors = true
  vim.opt.background = os.getenv("XORG_COLORSCHEME")
  vim.opt_local.foldmethod = 'indent'
  vim.opt_local.foldnestmax = 2
end

return M

