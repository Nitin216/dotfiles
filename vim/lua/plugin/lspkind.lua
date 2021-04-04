local icons = require "nvim-nonicons"

require "lspkind".init({
  symbol_map = {
    Text = icons.get("typography"),
    Method = icons.get("package"),
    Function = icons.get("package"),
    Constructor = '',
    Variable = icons.get("variable"),
    Class = icons.get("class"),
    Interface = icons.get("interface"),
    Module = '',
    Property = icons.get("tools"),
    Unit = icons.get("note"),
    Value = icons.get("note"),
    Enum = icons.get("list-unordered"),
    Keyword = icons.get("typography"),
    Snippet = icons.get("snippet"),
    Color = icons.get("heart"),
    File = icons.get("file"),
    Folder = icons.get("file-directory-outline"),
    EnumMember = icons.get("list-unordered"),
    Constant = icons.get("constant"),
    Struct = icons.get("struct"),
  },
})
    -- Module = "{}(module)",
    -- Field = icons.get("field"),
    -- Event = icons.get("zap"),
    -- Operator = icons.get("diff"),
    -- Reference = icons.get("file-symlink-file"),
    -- TypeParameter = icons.get("type")
