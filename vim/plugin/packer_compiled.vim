" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/i339130/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/i339130/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/i339130/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/i339130/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/i339130/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["base16-vim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/kotlin-vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-terminal.lua"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/nvim-terminal.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-web-nonicons"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/nvim-web-nonicons"
  },
  onehalf = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/onehalf/vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  pinnacle = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/pinnacle"
  },
  playground = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["swift.vim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/swift.vim"
  },
  ["telescope-cheat.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/telescope-cheat.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-writer.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/telescope-fzf-writer.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-be-good"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-js"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-js"
  },
  ["vim-jsonc"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-jsonc"
  },
  ["vim-jsx-pretty"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-jsx-pretty"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-qf"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-react-snippets"
  },
  ["vim-reason-plus"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-reason-plus"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-scriptease"
  },
  ["vim-searchindex"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-searchindex"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["yats.vim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/yats.vim"
  }
}

-- Runtimepath customization
vim.o.runtimepath = vim.o.runtimepath .. ",/Users/i339130/.local/share/nvim/site/pack/packer/start/onehalf/vim"
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
