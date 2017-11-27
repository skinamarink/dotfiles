" vim-plug. use gits.

call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'
Plug 'jalvesaq/Nvim-r'
Plug 'chrisbra/csv.vim'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-markdownfootnotes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-slash'
Plug 'mattly/vim-markdown-enhancements'
Plug 'unblevable/quick-scope'
Plug 'Konfekt/FastFold'
Plug 'blindFS/vim-taskwarrior'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
"Plug 'python-mode/python-mode'

"===color schemes===

Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/solarized'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'

" Toggles light/dark bg with 'call togglebg#map()
Plug 'rakr/vim-togglebg'


call plug#end()

" --------General Behavior--------"

set title

" togglebg:
call togglebg#map("<F5>")

set mouse=a
set foldmethod=syntax
set number
filetype plugin on
filetype indent on
set nocompatible
syntax enable
set tabstop=4
set encoding=utf-8
"set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set textwidth=80
set autoindent

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"restore backspace functionality (wouldn't let me backspace over insertion
"point)
set bs=2 

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
 "  set mouse=vi "a
"endif

" try synchronise vim's default copy/paste register with the system one
set clipboard^=unnamed

" --------Vanity-----------"
colorscheme solarized
let g:airline_theme='solarized'
""GVim options
if has('gui_running')
    set guifont=Fira\ Mono\ 11
    set bg=light
    colo solarized
else 
    set bg=dark
    hi Normal ctermbg=none guibg=NONE
    hi NonText ctermbg=none guibg=NONE
endif

"" get colors from base16-shell
"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  set guifont=Fira\ Mono\ 12
"  source ~/.vimrc_background
"  let g:airline_theme='base16_tomorrow'
"endif


" Highlight the last searched pattern:
set hlsearch

" Show where the next pattern is as you type it:
set incsearch

" By default, Vim indents code by 8 spaces. Most people prefer 4
" spaces:
set sw=4
set expandtab

" Remove GUI toolbar:
set guioptions-=T 

" Saves and loads fold status on enter/exit
au BufWinLeave *.* mkview 
au BufWinEnter *.* silent loadview 
" ---------Filetype Behaviors----------"





" Pencil
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,Rmd call pencil#init() "| call lexical#init() | call litecorrect#init()
  autocmd FileType text         call pencil#init() "| call lexical#init() | call litecorrect#init()
augroup END

" CSV

let g:csv_autocmd_arrange = 1


" Goyo

"augroup markdown
"    autocmd!
"    autocmd Filetype markdown,mkd call SetUpMk()
"    autocmd Filetype markdown,mkd setlocal textwidth=100
"augroup END

"function! SetUpMk()
    " execute `Goyo` if it's not already active
"    if !exists('#goyo')
"        Goyo
"    endif
"endfunction


"patch colors on colorscheme call

augroup colorfix
    autocmd!
    autocmd colorscheme * highlight Normal ctermbg=none
augroup END
" ---------Plugin Behavior------------"

" ==Airline==

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_base16_improved_contrast = 1
let airline#extensions#tmuxline#enabled = 1

" ==Table Mode==
" Use Pandoc grid tables
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

"==Pandoc==

let g:pandoc#folding#fold_yaml=1
let g:pandoc#folding#fold_fenced_codeblocks=1
" let g:pandoc#modules#disabled = ["folding"]

" ==Pencil=="


" ==Markdown Mode
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toc_autofit = 1

" ==Limelight== "
" Start limelight when Goyo starts
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'Gray'
let g:limelight_conceal_ctermfg = 240


" ==python-mode==
let g:pymode_python = 'python3'
let g:pymode = 1
let g:pymode_options = 1
let g:pymode_syntax = 1
let g:pymode_rope = 1


" ==R==
" Runs in separate terminal if not in nvim
"if !has('nvim')
"	let R_notmuxconf = 0
"	let R_in_buffer = 0 
"	let R_tmux_split = 1
"    let R_applescript = 0
"endif

"Runs in separate terminal always

	let R_notmuxconf = 0
	let R_in_buffer = 0 
	let R_tmux_split = 1
    let R_applescript = 0





"opens R output in a new pane rather than a tab:
"let R_routnotab = 1
let Rout_more_colors = 1
let R_pdfviewer = "zathura"

" start R with F2 key
map <F2> <Plug>RStart 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection 
" send line to R with space bar
nmap <Space> <Plug>RDSendLine
nmap <F3> <Plug>RUpdateObjBrowser

let R_term="urxvt256c-ml"
let R_rconsole_height = 10  
let R_nvimpager="vertical"
let R_args_in_stline = 1
let r_syntax_folding = 1
let rmd_syn_hl_chunk = 1

" ==vim-slash==

"centers window on current match
noremap <plug>(slash-after) zz


" ==UltiSnips==
"
" Trigger Config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltisnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsEditSplit="vertical"


"==Markdown=="
""
"
let g:vim_markdown_toc_autofit=1


"==Quickscope=="

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"==Syntastic=="

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"== ALE ==
"use airline 
let g:airline#extensions#ale#enabled = 1
