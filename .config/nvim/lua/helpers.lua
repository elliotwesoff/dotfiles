local M = {}

function M.clear_bg_color()
  vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
  vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
end

function M.buf_format_json()
  vim.cmd(':%!python3 -m json.tool<CR>')
end

function M.refresh_config()
  local config_path = '~/dotfiles/.config/nvim/init.lua'
  vim.cmd('source ' .. config_path)
  vim.notify('Reloaded ' .. config_path, 'info', {title = 'Configuration reloaded'})
end

function M.toggle_theme()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end

function M.req_closure(plugin)
  return function()
    require('lazy').load({ plugins = { plugin }, wait = true })
  end
end

function M.conditional_qf_close()
  if #vim.diagnostic.count() > 0 then
    vim.diagnostic.setqflist()
  else
    vim.cmd(':ConfirmClose')
  end
end

return M

