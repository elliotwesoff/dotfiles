local function clear_bg_color()
  vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
  vim.cmd('hi EndOfBuffer guibg=NONE ctermbg=NONE')
end

local function buf_format_json()
  vim.cmd(':%!python3 -m json.tool<CR>')
end

return {
  clear_bg_color = clear_bg_color,
  buf_format_json = buf_format_json
}




