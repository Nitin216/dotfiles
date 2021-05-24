local util = {}

-- "Safe" version of `nvim_get_var()` that returns `nil` if the
-- variable is not set
util.get_var = function(handle, name)
  local result
  pcall(function ()
    result = vim.api.nvim_get_var(handle, name)
  end)
  return result
end


-- "Safe" version of `nvim_tabpage_get_var()` that returns `nil` if the
-- variable is not set
util.tabpage_get_var = function(handle, name)
  local result
  pcall(function ()
    result = vim.api.nvim_tabpage_get_var(handle, name)
  end)
  return result
end

-- "Safe" version of `nvim_win_get_var()` that returns `nil` if the
-- variable is not set
util.win_get_var = function(handle, name)
  local result
  pcall(function ()
    result = vim.api.nvim_win_get_var(handle, name)
  end)
  return result
end

 util.is_buffer_empty = function ()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand('%:t')) == 1
  end

util.has_width_gt = function(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

return util
