local autocmds = {}
local set_cursorline = function(active)
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
  if autocmds.cursorline_blacklist[filetype] ~= true then
    vim.api.nvim_win_set_option(0, 'cursorline', active)
  end
end

autocmds.win_new = function()
  set_cursorline(true)
end

autocmds.insert_enter = function()
  set_cursorline(false)
end

autocmds.insert_leave = function()
  set_cursorline(true)
end

autocmds.vim_enter = function()
  set_cursorline(true)
end


autocmds.win_enter = function()
  set_cursorline(true)
end


autocmds.win_leave = function()
  set_cursorline(false)
end


autocmds.cursorline_blacklist = {
}

return autocmds

