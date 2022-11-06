local function apply_settings()
  vim.cmd('let mapleader = ","')

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
  vim.opt.showmode = false
  vim.opt.updatetime = 300
  vim.opt.backspace = 'indent,eol,start'
  vim.opt.pastetoggle = '<F3>'
  vim.opt.signcolumn = 'number'
  vim.opt.encoding = 'utf-8'
  vim.opt.ttimeout = true
  vim.opt.ttimeoutlen = 10
  vim.opt.sw = 2
  vim.opt.sts = 2
  vim.opt.ts = 2
  vim.opt.mouse = 'a'
  vim.opt.cmdheight = 0
  vim.opt.termguicolors = true
  -- vim.opt.wildignore += "*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*"

  -- GLOBAL SETTINGS
  vim.g.minimap_auto_start = 1
  vim.g.ale_disable_lsp = 1
  vim.g.ale_linters = {
    ['python'] = {'pylint'},
    ['cpp'] = {'ccls'},
    ['c'] = {'ccls'}
  }

  -- nvim difftool configuration
  vim.cmd([[
    if &diff
      highlight! link DiffText MatchParen
    endif
  ]])
end

return { apply_settings = apply_settings }
