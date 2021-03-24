-- local autocmds = {}
-- local set_cursorline = function(active)
--   local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
--   if autocmds.cursorline_blacklist[filetype] ~= true then
--     vim.api.nvim_win_set_option(0, 'cursorline', active)
--   end
-- end

-- autocmds.buf_enter = function()
--   require'nc.statusline'.focus_statusline()
-- end

-- autocmds.win_new = function()
--   print(vim.bo.filetype)
--   set_cursorline(true)
--   require'nc.statusline'.focus_statusline()
-- end

-- autocmds.focus_gained = function()
--   require'nc.statusline'.focus_statusline()
-- end


-- autocmds.focus_lost = function()
--     require'nc.statusline'.blur_statusline()
-- end

-- autocmds.insert_enter = function()
--   set_cursorline(false)
-- end

-- autocmds.insert_leave = function()
--   set_cursorline(true)
-- end

-- autocmds.vim_enter = function()
--   set_cursorline(true)
--   require'nc.statusline'.focus_statusline()
-- end


-- autocmds.win_enter = function()
--   set_cursorline(true)
--   require'nc.statusline'.focus_statusline()
-- end


-- autocmds.win_leave = function()
--   set_cursorline(false)
--   require'nc.statusline'.blur_statusline()
-- end


-- autocmds.cursorline_blacklist = {
--   -- ['startify'] = true,
--   -- ['NvimTree'] = true
-- }

-- return autocmds

