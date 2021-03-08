local actions = require('telescope.actions')

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>" ] = actions.send_to_qflist
            }
        }
    },
    extensions = {
        fzy_native = {
            override_genertic_sorter = false,
            override_file_sorter = true,
        },
        -- fzf_writer = {
        --     minimum_grep_characters = 2,
        --     minimum_files_characters = 2,
        -- }
    }
}

require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('fzf_writer')
