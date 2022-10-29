local function apply_colorscheme()
  local colorscheme = os.getenv("XORG_COLORSCHEME")
  if (colorscheme == "light")
  then
    vim.cmd("colorscheme onehalflight")
  elseif (colorscheme == "dark")
  then
    vim.cmd("colorscheme onehalfdark")
  else
    vim.cmd("colorscheme desert")
  end
end

return { apply_colorscheme = apply_colorscheme }

