local function ddc_config()
  vim.cmd("call ddc#custom#patch_global('sources', ['nvim-lsp', 'treesitter'])")
  vim.cmd([[
      call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'matchers': ['matcher_head'],
            \   'sorters': ['sorter_rank'] },
            \ 'nvim-lsp': {
            \   'mark': 'lsp',
            \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
            \ 'around': {'mark': 'A'},
            \ })
  ]])
  vim.cmd([[
      call ddc#custom#patch_global('sourceParams', {
            \ 'around': {'maxSize': 500},
						\ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' }, 'maxSize': 50 },
            \ })
  ]])
  vim.cmd([[
      call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['nvim-lsp', 'treesitter', 'around'])
  ]])
  vim.cmd([[
      call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', { })
  ]])
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

return { ddc_config = ddc_config }
