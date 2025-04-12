return {
  {
    'numToStr/Comment.nvim',
    event = 'BufReadPost',
    config = function()
      local km = require('keymaps').ext_keymaps.comment
      require('Comment').setup({
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = km.toggler,
        opleader = km.opleader,
        extra = km.extra,
        mappings = { basic = true, extra = true },
        pre_hook = nil,
        post_hook = nil
      })
    end
  }
}
