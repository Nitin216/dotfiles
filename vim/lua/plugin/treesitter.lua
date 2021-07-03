local ts_debugging = false

if ts_debugging then
  RELOAD('nvim-treesitter')
end

local enabled = true

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'query', 'lua', 'tsx', 'typescript'},

  highlight = {
    enable = enabled,
    disable = {"json"},
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<space>nn",
      node_incremental = "<space>nn",
      scope_incremental = "<space>grc",
      node_decremental = "<space>grm",
    },
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = true,
    },
    select = {

      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
      },
    }
  }
}

  vim.cmd [[nnoremap <space>tp :TSPlaygroundToggle<CR>]]
  vim.cmd [[nnoremap <space>th :TSHighlightCapturesUnderCursor<CR>]]
