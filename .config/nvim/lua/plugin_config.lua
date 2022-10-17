local function apply_ddc_config()
  vim.api.nvim_call_function('ddc#custom#patch_global', {'sources', {'nvim-lsp', 'treesitter', 'buffer'}})
  -- vim.cmd("call ddc#custom#patch_global('sources', ['nvim-lsp', 'treesitter', 'buffer'])")
  vim.cmd([[
      call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'matchers': ['matcher_head'],
            \   'sorters': ['sorter_rank'] },
            \ 'nvim-lsp': {
            \   'mark': 'LSP',
            \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
            \ 'around': {'mark': 'A'},
            \ 'treesitter': {'mark': 'TREE'},
            \ 'buffer': {'mark': 'B'}
            \ })
  ]])
  vim.cmd([[
      call ddc#custom#patch_global('sourceParams', {
            \ 'around': {'maxSize': 500},
						\ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' }, 'maxSize': 50 },
            \ 'buffer': {
            \   'requireSameFiletype': v:false,
            \   'limitBytes': 1000000,
            \   'fromAltBuf': v:true,
            \   'forceCollect': v:false,
            \ },
            \ })
  ]])
  vim.cmd([[
      call ddc#custom#patch_filetype(
      \ ['c', 'cpp', 'markdown'],
      \ 'sources',
      \ ['nvim-lsp', 'treesitter', 'around']
      \ )
  ]])
  -- vim.cmd([[
  --     call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', { })
  -- ]])
  vim.cmd([[
      inoremap <silent><expr> <TAB>
      \ ddc#map#pum_visible() ? '<C-n>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
  ]])
  vim.cmd([[
      inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'
  ]])
  vim.cmd("call ddc#enable()")
end

local function apply_lsp_config()
  local keymap_opts = { noremap = true, silent = true }

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, keymap_opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.setloclist, keymap_opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<A-F12>', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  end

  local lspconfig = require('lspconfig')
  local lsp_flags = { debounce_text_changes = 50 }

  lspconfig.pyright.setup {
      on_attach = on_attach,
      flags = lsp_flags,
  }

  lspconfig.tsserver.setup {
      on_attach = on_attach,
      flags = lsp_flags,
  }

  lspconfig.sumneko_lua.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = {"vim"},
        },
      },
    }
  }

  lspconfig.ccls.setup {
    on_attach = on_attach,
    flags = lsp_flags
  }

  -- lspconfig.clangd.setup {
  --   on_attach = on_attach,
  --   flags = lsp_flags
  -- }
end

local function apply_lualine_config()
  require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = 'auto',
      component_separators = { left = '🍕', right = '🌊' },
      section_separators = { left = '💥', right = '🍣' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = false,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
end

local function apply_nvim_tree_config()
  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1

  require("nvim-tree").setup({
    view = {
      adaptive_size = false,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
          { key = "|", action = "vsplit" },
          { key = "s", action = "vsplit" },
          { key = "-", action = "split" },
          { key = "i", action = "split" },
          { key = "t", action = "tabnew" }
        }
      }
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
      highlight_opened_files = "icon",
      indent_markers = {
        enable = true
      }
    },
    filters = {
      dotfiles = true
    }
  })
end

local function apply_telescope_config()
  local telescope = require('telescope')

  telescope.setup {
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key"
        }
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    }
  }

  telescope.load_extension 'file_browser'
end

local function apply_treesitter_config()
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "lua", "cpp", "python", "typescript", "c_sharp", "cmake", "ruby", "sql", "markdown" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser)
      -- list of language that will be disabled
      -- disable = { "c", "rust" },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    }
  }
end

local function apply_comment_config()
  require('Comment').setup {
      ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      ignore = nil,
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
          ---Line-comment toggle keymap
          line = '<Leader>,',
          ---Block-comment toggle keymap
          block = 'gbc',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
          ---Line-comment keymap
          line = '<Leader>,',
          ---Block-comment keymap
          block = 'gb',
      },
      ---LHS of extra mappings
      extra = {
          ---Add comment on the line above
          above = 'gcO',
          ---Add comment on the line below
          below = 'gco',
          ---Add comment at the end of line
          eol = 'gcA',
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
          ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
      },
      ---Function to call before (un)comment
      pre_hook = nil,
      ---Function to call after (un)comment
      post_hook = nil
  }
end


return {
  apply_ddc_config = apply_ddc_config,
  apply_lsp_config = apply_lsp_config,
  apply_lualine_config = apply_lualine_config,
  apply_nvim_tree_config = apply_nvim_tree_config,
  apply_telescope_config = apply_telescope_config,
  apply_treesitter_config = apply_treesitter_config,
  apply_comment_config = apply_comment_config
}
