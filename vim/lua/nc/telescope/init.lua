if not pcall(require, 'telescope') then
  return
end


local should_reload = true
local reloader = function()
  if shoud_reload then
    RELOAD('plenary')
    RELOAD('popup')
    RELOAD('telescope')
  end
end

reloader()

local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local themes = require('telescope.themes')

require('telescope').setup {
  defaults = {
    prompt_prefix = '❯ ',
    selection_caret = '❯ ',

    winblend = 0,
    preview_cutoff = 120,

    layout_strategy = 'horizontal',
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    prompt_position = "top",
    color_devicons = true,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.select_horizontal,

        -- Experimental
        ["<tab>"] = actions.toggle_selection,

        ["<C-q>"] = actions.send_to_qflist,
        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },

    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},

   -- file_sorter = sorters.native_fzf_sorter,
    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  },

  extensions = {
    -- fzy_native = {
    --   override_generic_sorter = false,
    --   override_file_sorter = true,
    -- },
    -- fzf_writer = {
    --   use_highlighter = true,
    --   minimum_grep_characters = 2,
    --   minimum_file_characters = 2,
    -- },
    fzf = {
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    frecency = {
      workspaces = {
        ["conf"] = "~/dotfiles",
        ["orca"] = "~/git/orca_cloud",
        ["ios"] = "~/git/SAP-Analytics-Cloud-iOS"
      }
    }
  }
}


-- pcall(require('telescope').load_extension, "fzy_native")
pcall(require('telescope').load_extension, "fzf")
pcall(require('telescope').load_extension, "fzf_writer")
pcall(require('telescope').load_extension, "frecency")
pcall(require('telescope').load_extension, "cheat")
-- pcall(require('telescope').load_extension, "dap")
--
--
local M = {}

function M.installed_plugins()
  require('telescope.builtin').find_files {
    winblend = 5,
    border = true,
    cwd = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
  }
end

function M.git_files()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = true,
  }
  require('telescope.builtin').git_files(opts)
end

function M.dotfiles()
  require('telescope.builtin').find_files {
    prompt_title = "Dotfiles",
    winblend = 5,
    border = true,
    cwd = "~/dotfiles"
  }
end

function M.buffer_git_files()
  require('telescope.builtin').git_files(themes.get_dropdown {
    cwd = vim.fn.expand("%:p:h"),
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  })
end

function M.git_branches()
  require('telescope.builtin').git_branches(themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  })
end

function M.lsp_code_actions()
  require('telescope.builtin').lsp_code_actions {
    previewer = false,
    winblend = 5, 
    border = true
  }

end

function M.search_all_files()
  require('telescope').extensions.fzf_writer.files {
    find_command = { 'rg', '--no-ignore', '--files', },
  }
end

function M.project_search()
  require('telescope.builtin').find_files {
    previewer = false,
    shorten_path = true,
    layout_strategy = "horizontal",
    cwd = require('lspconfig.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

function M.project_search_hidden()
  require('telescope.builtin').find_files {
    hidden = true,
    previewer = false,
    layout_strategy = "horizontal",
    cwd = require('lspconfig.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end


function M.fd()
  require('telescope.builtin').fd()
end

function M.builtin()
  require('telescope.builtin').builtin()
end

function M.live_grep()
  require('telescope').extensions.fzf_writer.staged_grep {
    shorten_path = true,
    previewer = false,
    fzf_separator = "|>",
  }
end

function M.grep_prompt()
  require('telescope.builtin').grep_string {
    shorten_path = true,
    search = vim.fn.input("Grep String > "),
  }
end

function M.help_tags()
  require('telescope.builtin').help_tags {
    show_version = true,
  }
end

function M.buffers()
  require('telescope.builtin').buffers {
    shorten_path = true,
    -- only_cwd = true
  }
end

function M.file_browser()
  require('telescope.builtin').file_browser {
    winblend = 8,
    previewer = false,
  }
end

function M.file_curr_browser()
  require('telescope.builtin').file_browser (
  themes.get_dropdown {
    cwd = vim.fn.expand("%:p:h"),
    winblend = 10,
    previewer = false,
  })

end

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    if M[k] then
      return M[k]
    else
      return require('telescope.builtin')[k]
    end
  end
})

