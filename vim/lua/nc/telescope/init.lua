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

local actions = require"telescope.actions"
local action_state = require "telescope.actions.state"
local sorters = require"telescope.sorters"
local themes = require"telescope.themes"

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end
  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

local _ = pcall(require, "nvim-nonicons")

require('telescope').setup {
  defaults = {
    prompt_prefix = '❯ ',
    selection_caret = '❯ ',

    winblend = 0,

    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.95,
      height = 0.85,
      prompt_position = "top",
      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },
      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },
      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    color_devicons = true,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,

        -- Experimental
        ["<tab>"] = actions.toggle_selection,
        ["<C-y>"] = set_prompt_to_entry_value,

        ["<C-q>"] = actions.send_to_qflist,
        ["<C-l>"] = actions.delete_buffer,
      },
    },

    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},

    file_sorter = sorters.native_fzf_sorter,
    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  },

  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    fzf_writer = {
      use_highlighter = false,
      minimum_grep_characters = 6,
      -- minimum_file_characters = 2,
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = false,
      case_mode = "smart_case",
    },
    frecency = {
      workspaces = {
        ["conf"] = "~/dotfiles",
        ["orca"] = "~/git/orca_cloud/fpa-bi/watchlist",
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
    winblend = 20,
    border = true,
    previewer = false,
    layout_config = {
      height = 30,
      width = 100,
    }
  }
  require('telescope.builtin').git_files(opts)
end

function M.dotfiles()
  require('telescope.builtin').find_files {
    prompt_title = "~ dotfiles ~",
    winblend = 5,
    cwd = "~/dotfiles",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.9,
      preview_width = 0.4
    },
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
  local opts = themes.get_dropdown {
    previewer = false,
    winblend = 10,
    result_height = 30,
    border = true,
  }

  require('telescope.builtin').lsp_code_actions(opts)

end

function M.search_all_files()
  require('telescope').extensions.fzf_writer.files {
    find_command = { 'rg', '--no-ignore', '--files', },
  }
end

function M.project_search()
  require('telescope.builtin').find_files ( themes.get_ivy {
    winblend = 10,
    cwd = require('lspconfig.util').root_pattern(".git")(vim.fn.expand("%:p")),
  })
end

function M.project_search_hidden()
  require('telescope.builtin').find_files {
    hidden = true,
    shorten_path = true,
    layout_strategy = "horizontal",
    cwd = require('lspconfig.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end


function M.fd()
  require('telescope.builtin').fd( themes.get_ivy {
    winblend = 15,
    layout_config = {
      height = 20,
    },
  })
end
 function M.curbuf()
   local opts = themes.get_dropdown {
     winblend = 10,
     border = 10,
     previewer = false,
     shorten_path = false
   }

   require("telescope.builtin").current_buffer_fuzzy_find(opts)
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
  require('telescope.builtin').grep_string ( themes.get_ivy {
    use_regex = true,
    shorten_path = true,
    search = vim.fn.input("Grep String > "),
  })
end

function M.git_stash()
  require('telescope.builtin').git_stash()
end

function M.help_tags()
  require('telescope.builtin').help_tags {
    show_version = true,
  }
end

function M.buffers()
  require('telescope.builtin').buffers ( themes.get_ivy {
    path_display = true,
  })
end

function M.file_browser()
  require('telescope.builtin').file_browser ( themes.get_dropdown {
    winblend = 8,
    previewer = false,
    results_height = 30,
    width = 90
  })
end

function M.file_curr_browser()
  require('telescope.builtin').file_browser (
  themes.get_dropdown {
    cwd = vim.fn.expand("%:p:h"),
    winblend = 8,
    previewer = false,
    results_height = 30,
    width = 90
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

