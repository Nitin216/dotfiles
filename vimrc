"Setting basic stuff
set autoindent
set backspace=indent,eol,start
" set complete-=i
set cursorline
set modeline
set encoding=utf8
filetype indent on
set wildmenu
set pyxversion=3
set guicursor=
set clipboard=unnamedplus

" TextEdit might fail if hidden is not set.
" set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
" set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Mouse integration
set mouse=a

" plugins added
call plug#begin()

Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'quramy/tsuquyomi'
Plug 'tpope/vim-fugitive'
Plug 'palantir/tslint'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'keith/swift.vim'
Plug 'udalov/kotlin-vim'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/pinnacle'
Plug 'wincent/ferret'
Plug 'wincent/loupe'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
endif

call plug#end()

"Coolest mapping by far"
inoremap jk <Esc>
""
" Setting leader key
let mapleader=" "

let g:vim_be_good_floating = 0

command! BufOnly execute '%bdelete|edit #|normal `"'

" FzF configs
let g:fzf_preview_window = ''
let g:fzf_preview_window = 'right:20%'

" Base16-shell integration
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Loupe config
"
let g:LoupeCenterResults=0

map <Nop><F1> <Plug>(LoupeN)
nmap <Nop><F2> <Plug>(Loupen)

" Python setup
let g:python3_host_prog="/Library/Frameworks/Python.framework/Versions/3.7/bin/python3"

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 51ae14d768763f05e749ee288e3e989d ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/i339130/.opam/4.10.0/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
