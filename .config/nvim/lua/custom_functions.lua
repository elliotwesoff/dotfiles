local function clear_bg_color()
  vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
  vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
end

local function buf_format_json()
  vim.cmd(':%!python3 -m json.tool<CR>')
end

local function pum_visible()
  return false
end

local function refresh_config()
  local config_path = '~/dotfiles/.config/nvim/init.vim'
  vim.cmd('source ' .. config_path)
  vim.notify('Reloaded ' .. config_path, 'info', {title = 'Configuration reloaded'})
end

return {
  clear_bg_color = clear_bg_color,
  buf_format_json = buf_format_json,
  pum_visible = pum_visible,
  refresh_config = refresh_config
}

