set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" VimTex
Plugin 'lervag/vimtex'
"vimtex settings
let g:livepreview_previewer = 'zathura'
let g:tex_flavor='latex'
let g:vimtex_compiler_method='latexmk'
let g:vimtex_view_method='zathura'
" let g:vimtex_indent_on_ampersands=0
" let g:vimtex_view_skim_activate=1
" Extra shiz

"UltiSnips
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"

Plugin 'xuhdev/vim-latex-live-preview'

Plugin 'flazz/vim-colorschemes'

Plugin 'dhruvasagar/vim-table-mode'

Plugin 'aperezdc/vim-template'
let g:templates_directory = ['~/Documents/latexTemplates'] "NOTE: FILES HAVE TO BE
"INVISIBLE :(( 
let g:templates_no_autocmd=1
let g:templates_no_builtin_templates=1
let g:templates_global_name_prefix="template:" " PSYCHE :D

Plugin 'phanviet/vim-monokai-pro'

Plugin 'sheerun/vim-polyglot'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Proper cursor
let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[1 q"  " default cursor (usually blinking block) otherwise


"Numbers to the side
set number
"set relativenumber (makes latex slow)



"syntax on


"Templates for latex
" command TemplateMath r ~/Documents/latexTemplates/math.tex

"Proper formatting of paragraphs in LaTex
" Reformat lines (getting the spacing correct) (Mapped til Q) {{{
fun! TeX_fmt()
    if (getline(".") != "")
    let save_cursor = getpos(".")
        let op_wrapscan = &wrapscan
        set nowrapscan
        let par_begin = '^\(%D\)\=\s*\($\|\\label\|\\begin\|\\end\|\\\[\|\\\]\|\.\\\]\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\|\\noindent\>\)'
        let par_end   = '^\(%D\)\=\s*\($\|\\begin\|\\end\|\\\[\|\\\]\|\.\\\]\.\|\\place\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\)'
    try
      exe '?'.par_begin.'?+'
    catch /E384/
      1
    endtry
        norm V
    try
      exe '/'.par_end.'/-'
    catch /E385/
      $
    endtry
    norm gq
        let &wrapscan = op_wrapscan
    call setpos('.', save_cursor) 
    endif
endfun

nmap Q :call TeX_fmt()<CR>
" }}}


"colorscheme
set termguicolors
colorscheme monokai_pro
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:lightline = {
            \ 'colorscheme': 'monokai_pro',
            \ }

set textwidth=80

set tabstop=4
set smarttab
set softtabstop=4
set shiftwidth=4

set expandtab

"Ensures that cursor is block-shape when entering vim
augroup reset_cursor_shape
  au!
  autocmd VimEnter * normal! :startinsert :stopinsert
  autocmd VimEnter * redraw!
augroup END

"Because of problems in vimtex, should find better solution here
inoremap [] []

