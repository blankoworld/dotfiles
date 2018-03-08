set nocompatible
syntax on
filetype plugin indent on
"":colorscheme peachpuff
""colors ron
set background=dark "" for dark solarized
colors default
set ai "" autoindent
set nu "" line number
set ts=2
set et "" expand tab
set softtabstop=2
set shiftwidth=2
set encoding=utf-8
set colorcolumn=81
highlight ColorColumn ctermbg=7


"" Plugin vim sur github:plasticboy/vim-markdown
"" ne pas utiliser le folding pour le markdown
let g:vim_markdown_folding_disabled=1

"" Should be placed (highlight) after colorColumn highlight
highlight Normal guibg=NONE ctermbg=NONE "" highlight
highlight LineNr guibg=NONE ctermbg=NONE "" highlight for line numbers

"" vim-airlines utilisant powerline-fonts
let g:airline_powerline_fonts = 1
