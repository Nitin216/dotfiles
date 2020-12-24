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
set tabstop=2
" TextEdit might fail if hidden is not set.
" set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set formatoptions-=o    " O and o, don't continue comments
" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Mouse integration
set mouse=i

set completeopt=menuone,noinsert,noselect
let g:completion_confirm_key=""
let g:completion_matching_strategy_list = ['exact', 'substring','fuzzy']
let g:completion_trigger_length = 2

" plugins added
call plug#begin()
Plug 'mhinz/vim-startify'
" Plug 'preservim/nerdtree' 
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary' 
Plug 'reasonml-editor/vim-reason-plus'
" Plug 'tpope/vim-fugitive' 
" Plug 'palantir/tslint' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'keith/swift.vim'
Plug 'udalov/kotlin-vim'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/pinnacle'
Plug 'wincent/loupe'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
" LSP Stufff
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Plug 'lukas-reineke/format.nvim'

Plug 'rhysd/committia.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kevinoid/vim-jsonc'
Plug 'sheerun/vim-polyglot'
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-lua/telescope.nvim'
" Plug 'epilande/vim-react-snippets'
Plug 'jiangmiao/auto-pairs'
" Plug 'bronson/vim-visual-star-search'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

if filereadable(expand("./.vimrc_background"))
  let base16colorspace=256
  source ./.vimrc_background
endif

lua require('lspconfig').tsserver.setup{on_attach=require'completion'.on_attach}

let g:indentLine_setColors = 0
let g:indentLine_char = '│'
let g:indentLine_setConceal = 0

let g:tcomment_mapleader1=''
let g:tcomment_mapleader2=''
let g:tcomment_mapleader_comment_anyway=''
let g:tcomment_textobject_inlinecomment=''

let g:completion_enable_snippet = 'UltiSnips'
imap <silent> <C-l> <Plug>(completion_trigger)

"Coolest mapping by far"
inoremap jk <Esc>

" Setting leader key
let g:mapleader=" "

" let g:vim_be_good_floating = 0

command! BufOnly execute '%bdelete|edit #|normal `"'

" let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
" let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" " Nerd Tree config
" let NERDTreeQuitOnOpen = 1
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1

" " Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"     \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"     \ quit | endif
" " let g:webdevicons_enable_nerdtree = 1
" nnoremap <C-n> :NERDTreeToggle<CR>

" FzF configs
" let g:fzf_preview_window = 'right:50%'
" let g:fzf_layout = { 'down': '40%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Ack config

let g:ackprg='rg --vimgrep --type-not sql --smart-case'

let g:ack_autoclose = 1
let g:ack_use_cword_for_empty_search = 1

cnoreabbrev Ack Ack!

nnoremap <leader>/ :Ack!<Space>
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

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:lua_tree_side = 'left' "left by default
let g:lua_tree_width = 40 "30 by default
let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:lua_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:lua_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:lua_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:lua_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:lua_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:lua_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:lua_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:lua_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:lua_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:lua_tree_allow_resize = 1 "0 by default, will not resize the tree when opening a file
let g:lua_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:lua_tree_bindings = {
    \ 'edit':            ['<CR>', 'o'],
    \ 'edit_vsplit':     '<C-v>',
    \ 'edit_split':      '<C-x>',
    \ 'edit_tab':        '<C-t>',
    \ 'close_node':      ['<S-CR>', '<BS>'],
    \ 'toggle_ignored':  'I',
    \ 'toggle_dotfiles': 'H',
    \ 'refresh':         'R',
    \ 'preview':         '<Tab>',
    \ 'cd':              '<C-]>',
    \ 'create':          'a',
    \ 'remove':          'd',
    \ 'rename':          'r',
    \ 'cut':             'x',
    \ 'copy':            'c',
    \ 'paste':           'p',
    \ 'prev_git_item':   '[c',
    \ 'next_git_item':   ']c',
    \ }

" Disable default mappings by plugin
" Bindings are enable by default, disabled on any non-zero value
" let lua_tree_disable_keybindings=1

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:lua_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged' : '◉',
    \   'staged'   : '✚',
    \   'untracked': '◈',
    \   'renamed'  : '➜',
    \   'unmerged' : '═'
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'symlink': "",
    \   }
    \ }
" \   'Modified' : '◉',
" \   'Staged'   : '✚',
" \   'Untracked': '◈',
" \   'Renamed'  : '➜',
" \   'Unmerged' : '═',
" \   'Ignored'  : '▨',
" \   'Deleted'  : '✖',
" \   'Unknown'  : '?'
nnoremap <C-n> :LuaTreeToggle<CR>
nnoremap <leader>r :LuaTreeRefresh<CR>
nnoremap <leader>tf :LuaTreeFindFile<CR>
"" LuaTreeOpen and LuaTreeClose are also available if you need them

"set termguicolors " this variable must be enabled for colors to be applied properly

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

