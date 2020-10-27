-- Replicated wincent/.vim/lua/wincent/lsp.lua
local lsp = {}

local nnoremap = function (lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, {noremap = true, silent = true})
end

local on_attach = function()
  local mappings = {
    ['<Leader>ld'] = '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>',
    ['<c-'] = '<cmd>lua vim.lsp.buf.definition()<CR>',
    ['K'] = '<cmd>lua vim.lsp.buf.hover()<CR>',
    ['gd'] = '<cmd>lua vim.lsp.buf.declaration()<CR>',
  }

  for lhs, rhs in pairs(mappings) do
    nnoremap(lhs, rhs)
  end

  vim.api.nvim_win_set_option(0, 'signcolumn', 'yes')
end

lsp.bind = function()
  pcall(function()
    if vim.api.nvim_win_get_var(0, 'textDocument/hover') then
      nnoremap('K', ':call nvim_win_close(0, v:true)<CR>')
      nnoremap('<Esc>', ':call nvim_win_close(0, v:true)<CR>')

      vim.api.nvim_win_set_option(0, 'cursorline', false)

      vim.api.nvim_buf_set_option(0, 'modifiable', false)
    end
  end)
end

lsp.init = function()

  local cmd = vim.fn.expand(
    '~/code/lua-language-server/bin/macOS/lua-language-server'
  )

  local main = vim.fn.expand('~/code/lua-language-server/main.lua')

  if vim.fn.executable(cmd) == 1 then
    require'nvim_lsp'.sumneko_lua.setup {
      cmd = { cmd, '-E', main},
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            enable = true,
            globals = {'vim'},
          },
          filetypes = {'lua'},
          runtime = {
            path = vim.split(package.path, ':'),
            versioin = 'LuaJIT',
          },
        }
      },
    }
  end

  require'nvim_lsp'.tsserver.setup {
    on_attach = on_attach
  }

  require'nvim_lsp'.vimls.setup {
    on_attach = on_attach
  }

  require'nvim_lsp'.clangd.setup {
    on_attach = on_attach
  }

  require'nvim_lsp'.hls.setup {
    on_attach = on_attach
  }

  -- Overide hover highlight
  local method = 'textDocument/hover'
  local hover = vim.lsp.callbacks[method]
  vim.lsp.callbacks[method] = function (_, method, result)
    hover(_, method, result)

    for _, winnr in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      if pcall(function ()
        vim.api.nvim_win_get_var(winnr, 'textDocument/hover')
        end) then
        vim.api.nvim_wins_set_option(winnr, 'winhighlight', 'Normal:Visual,NormalNC:Visual')
        break
      else
        -- Not a hover window
      end
    end
  end
end

lsp.set_up_highlights = function()
  local pinnacle = require'wincent.pinnacle'

  vim.cmd('highlight LspDiagnosticsError ' ..pinnacle.decorate('italic,underline', 'ModeMsg'))

  vim.cmd('highlight LspDiagnosticsHint ' ..pinnacle.decorate('bold,italic,underline', 'Type'))

  vim.cmd('highlight LspDiagnosticsHintSign ' ..pinnacle.highlight({
    bg = pinnacle.extract_bg('ColorColumn'),
    fg = pinnacle.extract_fg('Type'),
  }))

  vim.cmd('highlight LspDiagnosticsErrorSign ' ..pinnacle.highlight({
    bg = pinnacle.extract_bg('ColorColumn'),
    fg = pinnacle.extract_fg('ErrorMsg'),
  }))
end

return lsp
