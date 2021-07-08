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
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/i339130/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/i339130/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/i339130/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/i339130/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/i339130/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/auto-pairs"
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
  ["dart-vim-plugin"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/dart-vim-plugin"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18nc.statusline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lir.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/lir.nvim"
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
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim-web-nonicons"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/nvim-web-nonicons"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/onedark.vim"
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
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["tabline.vim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/tabline.vim"
  },
  tabular = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope-cheat.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/telescope-cheat.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
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
  undotree = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-flutter"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-flutter"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-jsonc"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-jsonc"
  },
  ["vim-lsc"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-lsc"
  },
  ["vim-lsc-dart"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-lsc-dart"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-qf"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-scriptease"
  },
  ["vim-searchindex"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-searchindex"
  },
  ["vim-slime"] = {
    loaded = true,
    path = "/Users/i339130/.local/share/nvim/site/pack/packer/start/vim-slime"
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
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'galaxyline.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
