local signs = {}

signs.setup = function ()
  require('gitsigns').setup {
    signs = {
      add          = {hl = 'GitGutterAdd'   , text = '│', numhl='GitSignsAddNr'},
      change       = {hl = 'GitGutterChange', text = '│', numhl='GitSignsChangeNr'},
      delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitSignsDeleteNr'},
      topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitSignsDeleteNr'},
      changedelete = {hl = 'GitGutterChangeDelete', text = '~', numhl='GitSignsChangeNr'},
    },

    -- Can't decide if I like this or not :)
    numhl = false,
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n <space>hd'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
      ['n <space>hu'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},
    }
  }
end
return signs
