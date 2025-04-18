return {
  'hedyhli/outline.nvim',
  lazy = true,
  event = 'BufReadPost',
  cmd = { 'Outline', 'OutlineOpen' },
  config = function()
    require('outline').setup()
  end
}
