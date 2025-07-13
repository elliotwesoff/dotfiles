local M = {}

function M.apply_settings()
  vim.opt.hidden = true
  vim.opt.showcmd = false
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.startofline = true
  vim.opt.cursorline = true
  vim.opt.swapfile = false
  vim.opt.wrap = false
  vim.opt.confirm = true
  vim.opt.laststatus = 2
  vim.opt.number = true
  vim.opt.numberwidth = 4
  vim.opt.expandtab = true
  vim.opt.backup = false
  vim.opt.writebackup = false
  vim.opt.showmatch = true
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  vim.opt.updatetime = 0
  vim.opt.signcolumn = 'number'
  vim.opt.ttimeoutlen = 10
  vim.opt.mouse = 'a'
  vim.opt.cmdheight = 1
  vim.opt.termguicolors = true
  vim.opt.foldmethod = 'indent'
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = 2
  vim.opt.tabstop = 2
  vim.opt.foldnestmax = 4
  vim.opt.foldlevelstart = 4
  vim.opt.scrolloff = 2
  -- vim.opt.winborder = "rounded"
end

return M

