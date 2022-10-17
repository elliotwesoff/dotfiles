local function apply_settings()
  vim.cmd("colorscheme onehalfdark")
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
  vim.opt.foldlevel = 99
  vim.opt_local.foldmethod = 'indent'
  vim.opt.ttimeout = true
  vim.opt.ttimeoutlen = 10
  vim.opt.sw = 2
  vim.opt.sts = 2
  vim.opt.ts = 2
  vim.opt.mouse = 'a'
  vim.opt.cmdheight = 0
  -- vim.opt.wildignore += "*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*"
  -- vim.opt.nofoldenable = true

  -- GLOBAL SETTINGS
  vim.g.minimap_auto_start = 1

  vim.cmd([[
    " custom commands
    command! RefreshConfig source $MYVIMRC

    " nvim difftool configuration
    if &diff
      highlight! link DiffText MatchParen
    endif

    " ale settings
    let g:ale_disable_lsp = 1
    let g:ale_linters = {
      \ 'python': ['pylint'],
      \ 'vim': ['vint'],
      \ 'cpp': ['ccls'],
      \ 'c': ['ccls']
  \}
  ]])
end

return { apply_settings = apply_settings }
