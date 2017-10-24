"""

" -- themes, colors and everything that affects the look of Neovim

scriptencoding utf-8
set encoding=utf-8


" save colors from Git
" used for DiffColors and such
let g:GitAddColor = system('git config --list | grep added | grep -o -E "[0-8]"')
let g:GitChangeColor = system('git config --list | grep changed | grep -o -E "[0-8]"')
let g:GitUntrackedColor = system('git config --list | grep untracked | grep -o -E "[0-8]"')


" wal {{{

colorscheme wal

" }}}


" base16 {{{

" theme must be set before Neovim can use the fg and bg colors!
" see: :h cterm-colors: E419, E420
" https://github.com/chriskempson/base16-shell
" load theme from base16-shell
" let g:base16colorspace=256
" if IsMacOS()
  " if filereadable(expand('$HOME/.vimrc_background'))
    " source $HOME/.vimrc_background
  " endif
" else
  " if !exists('g:colors_name') || g:colors_name !=? 'base16-apathy'
    " colorscheme base16-apathy
  " endif
" endif

" }}}


" default settings {{{

" syntax enable - default neovim

" split border
set fillchars+=vert: 
highlight VertSplit ctermfg=8 ctermbg=8 cterm=NONE
highlight LineNr ctermbg=0 cterm=NONE
highlight CursorLineNr ctermfg=3 ctermbg=0 cterm=bold

" comments
highlight Comment cterm=italic

" selection
highlight CursorLine cterm=NONE
highlight Visual cterm=reverse ctermbg=0

" fold
highlight Folded ctermfg=8 cterm=NONE
highlight link FoldColumn CursorLineNr

" error
highlight Error ctermfg=7 cterm=NONE
highlight ErrorMsg ctermfg=1 cterm=NONE

" search
highlight Search ctermfg=0 cterm=NONE

" NonText
highlight NonText ctermfg=8 cterm=NONE
highlight EndOfBuffer ctermfg=0 cterm=NONE

" show the MatchParen more obvious
highlight MatchParen ctermfg=4 ctermbg=2 cterm=NONE

" set DiffColors according to Git colors
execute 'highlight DiffAdd cterm=reverse ctermfg=' . g:GitAddColor
execute 'highlight DiffChange cterm=reverse ctermfg=' . g:GitChangeColor
execute 'highlight DiffDelete cterm=reverse ctermfg=' . g:GitUntrackedColor
highlight DiffText ctermfg=4 cterm=reverse

" xml (jsx)
highlight XmlEndTag ctermfg=2 cterm=NONE


" http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter
augroup vim_enter
  autocmd!
  autocmd VimEnter * autocmd vim_enter WinEnter * let w:created=1
augroup END

" autoresize windows on terminal resize
augroup vim_resize
  autocmd!
  autocmd VimResized * execute "normal! \<C-w>="
augroup END

" disable paste mode on leaving INSERT mode
augroup insert_leave
  autocmd!
  autocmd InsertLeave * set nopaste
augroup END

" only show the colorcolumn if the width surpasses 80 on that specific line
highlight OverLength ctermfg=0 ctermbg=3
match OverLength /\%81v/

" only show cursorline on focused window
" autocmd BufEnter,FocusGained,VimEnter,WinEnter * setlocal cursorline
" autocmd FocusLost,WinLeave * setlocal nocursorline

" }}}
