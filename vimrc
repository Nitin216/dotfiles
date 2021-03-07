set pyxversion=3
set smartindent
" highlight PmenuSel blend=0

" TextEdit might fail if hidden is not set.
" set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
" set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
" Mouse integration

" Completion Setup
let g:completion_confirm_key=""
let g:completion_matching_strategy_list = [ "exact", "substring", "fuzzy" ]
let g:completion_enable_snippet = 'UltiSnips'
set completeopt=menuone,noinsert,noselect


" plugins added
call plug#begin()
"{{{ Startup
"Used also for Saving and Restoring session
":SSave and :SLoad TODO: Have to start using it more often
Plug 'mhinz/vim-startify'
"}}}
Plug 'dstein64/vim-startuptime'
"}}}
Plug 'tjdevries/express_line.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-fugitive'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'google/vim-searchindex'
"
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary' 
Plug 'reasonml-editor/vim-reason-plus'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'keith/swift.vim'
Plug 'udalov/kotlin-vim'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/pinnacle'
Plug 'mbbill/undotree'

Plug 'chriskempson/base16-vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'mileszs/ack.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'
" LSP Stufff
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp-status.nvim'
" Plug 'lukas-reineke/format.nvim'

Plug 'rhysd/committia.vim'
Plug 'airblade/vim-gitgutter'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim', { 'do': 'rm -rf UltiSnips'}
Plug 'kevinoid/vim-jsonc'
Plug 'jiangmiao/auto-pairs'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'romgrk/barbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mattn/emmet-vim'

call plug#end()

" if filereadable(expand("./.vimrc_background"))
"   source ./.vimrc_background
" endif

let v:hlsearch = 1

let g:user_emmet_leader_key = '<C-e>'

let g:UltiSnipsExpandTrigger = '<C-space>'
" let g:indentLine_setColors = 0
" let g:indentLine_char = '│'
" let g:indentLine_setConceal = 0
" imap <silent> <C-l> <Plug>(completion_trigger)

"Coolest mapping by far"
inoremap jk <Esc>

" Setting leader key
let g:mapleader=" "

command! BufOnly execute '%bdelete|edit #|normal `"'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" FzF configs
"
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.95} }
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

nnoremap <leader>/ :Find<Space>

" Python setup
let g:python3_host_prog="/Library/Frameworks/Python.framework/Versions/3.7/bin/python3"

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

" let s:opam_configuration = {}

" function! OpamConfOcpIndent()
"   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

" function! OpamConfOcpIndex()
"   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

" function! OpamConfMerlin()
"   let l:dir = s:opam_share_dir . "/merlin/vim"
"   execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')

" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor
" " ## end of OPAM user-setup addition for vim / base ## keep this line
" " ## added by OPAM user-setup for vim / ocp-indent ## 51ae14d768763f05e749ee288e3e989d ## you can edit, but keep this line
" if count(s:opam_available_tools,"ocp-indent") == 0
"   source "/Users/i339130/.opam/4.10.0/share/ocp-indent/vim/indent/ocaml.vim"
" endif
" " ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 0 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_allow_resize = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_show_icons = {
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
let g:nvim_tree_bindings = {
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
" let nvim_tree_disable_keybindings=1

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
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
nnoremap <silent><C-n> :NvimTreeToggle<CR>
nnoremap <silent><leader>r :NvimTreeRefresh<CR>
nnoremap <silent><leader>tf :NvimTreeFindFile<CR>
" Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
" nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()
"" NvimTreeOpen and LuaTreeClose are also available if you need them

" this variable must be enabled for colors to be applied properly

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

