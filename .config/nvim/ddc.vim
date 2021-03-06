call ddc#custom#patch_global('sources', ['ale', 'around', 'treesitter', 'omni'])
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('sourceOptions', {
\ '_': {
\   'matchers': ['matcher_fuzzy'],
\   'sorters': ['sorter_fuzzy'],
\   'converters': ['converter_fuzzy']
\ }
\ })
call ddc#custom#patch_global('sourceParams', {
\   'around': { 'maxSize': 500 },
\   'ale': {'cleanResultsWhitespace': v:false}
\ })
call ddc#custom#patch_global('filterParams', {
\   'matcher_fuzzy': {
\     'splitMode': 'character'
\   },
\   'converter_fuzzy': {
\     'hlGroup': 'SpellBad'
\   }
\ })

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()

