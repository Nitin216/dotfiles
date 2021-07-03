local has_lir, lir = pcall(require, 'lir')
if not has_lir then return end

local has_devicons, devicons = pcall(require, 'nvim-web-devicons')
if has_devicons then
  devicons.setup({
    override = {
      lir_folder_icon = {
        icon = "",
        color = "#7ebae4",
        name = "LirFolderNode"
      },
    }
  })
end

local actions = require'lir.actions'

lir.setup {
  show_hidden_files = true,
  devicons_enable = true,

  mappings = {
    ['<CR>']  = actions.edit,
    ['-']     = actions.up,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['Y']     = actions.yank_path,
    ['D']     = actions.delete,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit
  },
}


vim.api.nvim_set_keymap(
    'n',
    '-',
    [[<Cmd>execute 'e ' .. expand('%:p:h')<CR>]],
    { noremap = true }
)
