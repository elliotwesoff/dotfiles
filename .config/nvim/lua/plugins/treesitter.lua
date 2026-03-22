return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false, 
    lazy = false,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      local ts = require('nvim-treesitter')

      ts.install({
        'c', 'cpp', 'lua', 'python', 'typescript', 'ruby',
        'sql', 'markdown', 'fish', 'bash', 'make', 'udev',
        'toml', 'c_sharp'
      })
    end
  }
}
