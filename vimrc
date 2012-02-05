set backspace=indent,eol,start
set number

syntax enable
set nocompatible

set tabstop=4
set shiftwidth=4
set expandtab

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=81


function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction

if has("autocmd")
    filetype plugin indent on
    autocmd BufRead,BufNewFile Makefile* setl noexpandtab
    autocmd BufRead,BufNewFile *.rb,*.ru,Rakefile setl sw=2 sts=2

    autocmd VimEnter * exe 'NERDTree' | wincmd l
    autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
endif



call pathogen#infect()
