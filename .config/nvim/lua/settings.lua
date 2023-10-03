local M = {}

local function apply_global_settings()
  vim.g.mapleader = ","
  vim.g.vimtex_view_method = 'zathura'
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
  vim.opt.startofline = true
  vim.opt.cursorline = true
  vim.opt.swapfile = false
  vim.opt.wrap = false
  vim.opt.confirm = true
  vim.opt.visualbell = true
  vim.opt.laststatus = 2
  vim.opt.number = true
  vim.opt.numberwidth = 4
  vim.opt.expandtab = true
  vim.opt.autoindent = true
  vim.opt.backup = false
  vim.opt.writebackup = false
  vim.opt.showmatch = true
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  vim.opt.showmode = false
  vim.opt.updatetime = 0
  vim.opt.pastetoggle = '<F3>'
  vim.opt.signcolumn = 'number'
  vim.opt.encoding = 'utf-8'
  vim.opt.ttimeout = true
  vim.opt.ttimeoutlen = 10
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = 2
  vim.opt.tabstop = 2
  vim.opt.mouse = 'a'
  vim.opt.cmdheight = 0
  vim.opt.termguicolors = true
  vim.opt.foldmethod = 'indent'
  vim.opt.foldnestmax = 99
  vim.opt.foldlevelstart = 99
  vim.opt.scrolloff = 2

  -- vim.cmd([[
  --   let g:OmniSharp_server_use_mono = 1
  -- ]])
end

return M

