local treesitter = {}

treesitter.setup = function ()
require'nvim-treesitter.configs'.setup {
    highlight = { enable = true }
}
end
return treesitter
