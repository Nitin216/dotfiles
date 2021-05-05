local nvim_status = require("lsp-status")
local lsp_name = ""
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef';
  red      = '#ec5f67';
}
require ("lualine").setup {
  options = {
    theme = 'onedark',
    section_separators = {"", "" },
    component_separators = {"", ""},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''} },
    lualine_c = { {'filename', file_status = true},
                  {'diagnostics',
                   sources = {'nvim_lsp'},
                   symbols = {error = ' ', warn = ' ', info = ' '},
                   color_error = colors.red,
                   color_warn = colors.yellow,
                   color_info = colors.cyan},
                  { function() return '%=' end },
                  { Lsp_Progress, color = { fg =  colors.magenta} }},
    lualine_x = { 'encoding', 'filetype'},
    lualine_y = { 'progress' },
    lualine_z = { 'location'  },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {   }
  },
  extensions = { 'fugitive' }

}

function Lsp_Progress()

  local ok, result = pcall(nvim_status.messages)
  if not ok then return '' end
  if #result == 0 then
    return #lsp_name > 0 and 'LSP: '.. lsp_name or ''
  end
  for _, msg in ipairs(result) do
    local name = msg.name
    local client_name = '[' .. name .. ']'
    lsp_name = name
    local contents
    if msg.progress then
      contents = msg.title
      if msg.message then contents = contents .. ' ' .. msg.message end

      if msg.percentage then contents = contents .. ' (' .. msg.percentage .. ')' end

      -- if msg.spinner then
      --   contents = config.spinner_frames[(msg.spinner % #config.spinner_frames) + 1] .. ' ' ..
      --   contents
      -- end
    elseif msg.status then
      contents = msg.content
      if msg.uri then
        local filename = vim.uri_to_fname(msg.uri)
        filename = vim.fn.fnamemodify(filename, ':~:.')
        local space = math.min(60, math.floor(0.6 * vim.fn.winwidth(0)))
        if #filename > space then filename = vim.fn.pathshorten(filename) end

        contents = '(' .. filename .. ') ' .. contents
      end
    else
      contents = msg.content
    end

    return client_name .. ' ' .. contents
  end
end
