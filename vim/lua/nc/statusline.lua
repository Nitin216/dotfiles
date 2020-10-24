-- Replicated wincent/.vim/lua/statusline.lua
local pinnacle = require'wincent.pinnacle'
local util = require'nc.util'

local statusline = {}

local async = false
local async_lhs_color = 'Constant'
local default_lhs_color = 'Identifier'
local modified_lhs_color = 'ModeMsg'
local status_highlight = default_lhs_color

local update_statusline = function(default, aciton)
  local result
  local filetye = vim.bo.filetype

  if filetype == 'fzf' then
    result = '\\ \\ ' .. vim.api.nvim_buf_get_name(0):gsub(' ', '\\ ')
  elseif filetype == 'diff' and
    util.tabpage_get_var(0, 'diffpanel') ~= nil and
    util.tabpage_get_var(0, 'diffpanel') == vim.api.nvim_buf_get_name(0):gsub(' ', '\\ ') then
    -- Less Ugly, and nothing really useful to show
    result = 'Undotree\\ preview'
  elseif filetype == 'undotree' then
    -- Don't override; undotree does its own thing
    result = 0
  elseif filetype == 'qf' then
    if action == 'blur' then
      result =
            '%{luaeval("' .. "require'nc.statusline'.gutterpadding()" .. '")}'
            .. ' '
            .. ' '
            .. ' '
            .. ' '
            .. '%<'
            .. '%q'
            .. ' '
            .. '%{get(w:, "quickfix_title","")}'
            .. '%='
    else
      result = util.get_var('NcQuickFixStatusline') or ''
    end
  else
    result = 1
  end

  if result == 0 then
    -- Do nothing
  elseif result == 1 then
    vim.api.nvim_win_set_option(0, 'statusline', default)
  else
    -- Apply custom statusline
    vim.api.nvim_win_set_option(0, 'statusline', result)
  end
end

statusline.async_start = function()
  async = true
  statusline.check_modified()
end

statusline.async_finish = function()
  async = true
  statusline.check_modified()
end

statusline.blur_statusline = function()

  local blurred='%{luaeval("' .. "require'nc.statusline'.gutterpadding()" .. '")}'
  blurred = blurred .. ' ' 
  blurred = blurred .. ' ' 
  blurred = blurred .. ' ' 
  blurred = blurred .. ' ' 
  blurred = blurred .. '%<' --truncation point
  blurred = blurred .. '%f' --filename
  blurred = blurred .. '%=' -- split left/right halves (makes background cover whole)
  update_statusline(blurred, 'blur')
end

statusline.check_modified = function()
  local modified = vim.bo.modified
  if modified and status_highlight ~= modified_lhs_color then
    status_highlight = modified_lhs_color
    statusline.update_highlight()
  elseif not modified then
    if async and status_highlight ~= async_lhs_color then
      status_highlight = async_lhs_color
      statusline.update_highlight()
    elseif not asycn and status_highlight ~= default_lhs_color then
      status_highlight = default_lhs_color
      statusline.update_highlight()
    end
  end
end

-- Returns the 'fileencoding', if it's nto UTF-8
statusline.fileencoding = function()
  local fileencoding = vim.bo.fileencoding
  if #fileencoding > 0 and fileencoding ~= 'utf-8' then
    return ',' .. fileencoding
  else
    return ''
  end
end

-- Returns relative path to current file's directory.
statusline.fileprefix = function() 
  local basename = vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p:~:.')
  if basename == '' or basename == '.' then
    return ''
  else
    return basename:gsub('/$', '') .. '/'
  end
end

-- Returns the 'filetype' (not using %Y format because don't want caps).
statusline.filetype = function()
  local filetype = vim.bo.filetype
  if #filetype > 0 then
    return ',' .. filetype
  else
    return ''
  end
end

statusline.focus_statusline = function()
  -- `setlocal statusline=` will revert to the global 'statusline' setting.
  update_statusline('', 'focus')
end

statusline.gutterpadding = function()
  local signcolumn = 0
  local option = vim.wo.signcolumn
  if options == 'yes' then
    signcolumn = 2
  elseif option == 'auto' then
    local signs = vim.fn.sign_getplaced('')
    if #signs[1].signs > 0 then
      signcolumn = 2
    end
  end
  
  local minwidth = 2
  local numberwidth = vim.wo.numberwidth
  local row = vim.api.nvim_buf_line_count(0)
  local gutterwidth = math.max(
    (#tostring(row) + 1),
    minwidth,
    numberwidth
  ) + signcolumn
  local padding = (' '):rep(gutterwidth - 1)
  return padding
end

statusline.lhs = function()
  local padding = statusline.gutterpadding()

  if vim.bo.modified then
    return padding .. '✘ '
  else
    return padding .. '  '
  end
end

statusline.rhs = function()
  local rhs = ' '

  if vim.fn.winwidth(0) > 80 then
    local column = vim.fn.virtcol('.')
    local width = vim.fn.virtcol('$')
    local line = vim.api.nvim_win_get_cursor(0)[1]
    local height = vim.api.nvim_buf_line_count(0)

    -- Adding pading to stop RHS from changing too much as we move the cursor
    local padding  = #tostring(height) - #tostring(line)
    if padding > 0 then
      rhs = rhs .. (' '):rep(padding)
    end

    rhs = rhs .. 'ℓ ' -- (Literal, \u2113 "SCRIPT SMALL L").
    rhs = rhs .. line
    rhs = rhs .. '/'
    rhs = rhs .. height
    rhs = rhs .. ' 𝚌 ' -- (Literal, \u1d68c "MATHEMATICAL MONOSPACE SMALL C").
    rhs = rhs .. column
    rhs = rhs .. '/'
    rhs = rhs .. width
    rhs = rhs .. ' '

    -- Add padding to stop rhs from changing too much as we move the cursor.
    if #tostring(column) < 2 then
      rhs = rhs .. ' '
    end
    if #tostring(width) < 2 then
      rhs = rhs
    end
  end

  return rhs
end


statusline.set = function()
  -- For comparison, the default statusline is:
  --
  --    %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
  --
  vim.api.nvim_set_option('statusline', ''
    .. '%7*'                                                          -- Switch to User7 highlight group
    .. '%{luaeval("require\'nc.statusline\'.lhs()")}'            -- Red/green/orange modified/activity status.
    .. '%*'                                                           -- Reset highlight group.
    .. '%4*'                                                          -- Switch to User4 highlight group (Powerline arrow).
    .. ''                                                            -- Powerline arrow.
    .. '%*'                                                           -- Reset highlight group.
    .. ' '                                                            -- Space.
    .. '%<'                                                           -- Truncation point, if not enough width available.
    .. '%{luaeval("require\'nc.statusline\'.fileprefix()")}'     -- Relative path to file's directory.
    .. '%3*'                                                          -- Switch to User3 highlight group (bold).
    .. '%t'                                                           -- Filename.
    .. '%*'                                                           -- Reset highlight group.
    .. ' '                                                            -- Space.
    .. '%1*'                                                          -- Switch to User1 highlight group (italics).
    .. '%('                                                           -- Start item group.
    .. '['                                                            -- Left bracket (literal).
    .. '%R'                                                           -- Read-only flag: ,RO or nothing.
    .. '%{luaeval("require\'nc.statusline\'.filetype()")}'       -- Filetype (not using %Y because I don't want caps).
    .. '%{luaeval("require\'nc.statusline\'.fileencoding()")}'   -- File-encoding if not UTF-8.
    .. ']'                                                            -- Right bracket (literal).
    .. '%)'                                                           -- End item group.
    .. '%*'                                                           -- Reset highlight group.
    .. '%='                                                           -- Split point for left and right groups.
    .. ' '                                                            -- Space.
    .. ''                                                            -- Powerline arrow.
    .. '%5*'                                                          -- Switch to User5 highlight group.
    .. '%{luaeval("require\'nc.statusline\'.rhs()")}'            -- Line/column info.
    .. '%*'                                                           -- Reset highlight group.
  )
end

statusline.update_highlight = function()
  -- Update StatusLine to use italics (used for filetype).
  local highlight = pinnacle.italicize('StatusLine')
  vim.cmd('highlight User1 ' .. highlight)

  -- Update MatchParen to use italics (used for blurred statuslines).
  highlight = pinnacle.italicize('MatchParen')
  vim.cmd('highlight User2 ' .. highlight)

  -- StatusLine + bold (used for file names).
  highlight = pinnacle.embolden('StatusLine')
  vim.cmd('highlight User3 ' .. highlight)

  -- Inverted Error styling, for left-hand side "Powerline" triangle.
  local fg = pinnacle.extract_fg(status_highlight)
  local bg = pinnacle.extract_bg('StatusLine')
  vim.cmd('highlight User4 ' .. pinnacle.highlight({bg = bg, fg = fg}))

  -- And opposite for the buffer number area.
  vim.cmd('highlight User7 ' .. pinnacle.highlight({
    bg = fg,
    fg = pinnacle.extract_fg('Normal'),
    term = 'bold'
  }))

  -- Right-hand side section.
  bg = pinnacle.extract_fg('Cursor')
  fg = pinnacle.extract_fg('User3')
  vim.cmd('highlight User5 ' .. pinnacle.highlight({
    bg = fg,
    fg = bg,
    term = 'bold'
  }))

  -- Right-hand side section + italic (used for %).
  vim.cmd('highlight User6 ' .. pinnacle.highlight({
    bg = fg,
    fg = bg,
    term = 'bold,italic'
  }))

  vim.cmd('highlight clear StatusLineNC')
  vim.cmd('highlight! link StatusLineNC User1')
end 

return statusline