set pyxversion=3
set smartindent

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
":SSave and :SLoad 
Plug 'mhinz/vim-startify'
"}}}
Plug 'dstein64/vim-startuptime'
"}}}
" Plug 'tjdevries/express_line.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'google/vim-searchindex'
"
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary' 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
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
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" LSP Stufff
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'glepnir/lspsaga.nvim'

Plug 'rhysd/committia.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim', { 'do': 'rm -rf UltiSnips'}
Plug 'kevinoid/vim-jsonc'

Plug 'lewis6991/gitsigns.nvim'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

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

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
" nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()


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
  
