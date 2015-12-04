set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set nu
highlight Comment ctermfg=cyan
set cscopetag
set csto=1
set colorcolumn=81
set hlsearch
set splitright
set mouse=a

syntax on
colorscheme elflord


highlight ColorColumn ctermbg=blue

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red

" autocmd BufWritePre * :%s/\s\+$//e

if filereadable("cscope.out")
    cscope add cscope.out
endif
source ~/cscope_maps.vim
