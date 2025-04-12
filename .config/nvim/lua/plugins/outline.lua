return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    event = 'BufReadPost',
    cmd = { "Outline", "OutlineOpen" }
  }
}
