local function ddc_config()
  vim.cmd("call ddc#custom#patch_global('sources', ['around'])")
  vim.cmd([[
      call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'matchers': ['matcher_head'],
            \   'sorters': ['sorter_rank']},
            \ })
  ]])
  vim.cmd([[
      call ddc#custom#patch_global('sourceOptions', {
            \ 'around': {'mark': 'A'},
            \ })
  ]])
  vim.cmd([[
      call ddc#custom#patch_global('sourceParams', {
            \ 'around': {'maxSize': 500},
            \ })
  ]])
  vim.cmd([[
      call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
  ]])
  vim.cmd([[
      call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
            \ 'clangd': {'mark': 'C'},
            \ })
  ]])
  vim.cmd([[
      call ddc#custom#patch_filetype('markdown', 'sourceParams', {
            \ 'around': {'maxSize': 100},
            \ })
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
