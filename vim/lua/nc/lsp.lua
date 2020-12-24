-- Replicated wincent/.vim/lua/wincent/lsp.lua
local lsp = {}
local completion = require('completion')

local nnoremap = function (lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, {noremap = true, silent = true})
end

local on_attach = function()
  completion.on_attach()

  local mappings = {
    ['<Leader>ld'] = '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>',
    ['<c-'] = '<cmd>lua vim.lsp.buf.definition()<CR>',
    ['K'] = '<cmd>lua vim.lsp.buf.hover()<CR>',
    ['gd'] = '<cmd>lua vim.lsp.buf.declaration()<CR>',
  }

  for lhs, rhs in pairs(mappings) do nnoremap(lhs, rhs) end

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
    require('lspconfig').sumneko_lua.setup {
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

  require('lspconfig').tsserver.setup {
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    root_dir = vim.loop.cwd,
    on_attach = on_attach,
  }

  require('lspconfig').vimls.setup {
    on_attach = on_attach
  }

  require('lspconfig').clangd.setup {
    on_attach = on_attach
  }

  require('lspconfig').hls.setup {
    on_attach = on_attach
  }

  require('lspconfig').diagnosticls.setup {
    on_attach = on_attach,
    filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
    init_options = {
      linters = {
        eslint = {
          command = 'eslint',
          rootPattern = { '.eslintrc.json', '.git'},
          debounce = 100,
          args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
          sourceName = 'eslint',
          parseJson = {
                    errorsRoot = "[0].messages",
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "${message} [${ruleId}]",
                    security = "severity"
                },
                securities = {
                    [2] = "error",
                    [1] = "warning"
                }
        },
        filetypes = {
            javascript = "eslint",
            javascriptreact = "eslint",
            typescript = "eslint",
            typescriptreact = "eslint",
        }
      },
      formatters = {
        prettier = {
          command = 'prettier',
          args = { '--stdin-filepath', '%filename' }
        }
      },
      formatFiletypes = {
        javascript = 'prettier',
        javascriptreact = 'prettier',
        typescript = 'prettier',
        typescriptreact = 'prettier'
      }
    }
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

  vim.cmd('highlight LspDiagnosticsDefaultError ' ..pinnacle.decorate('italic', 'ModeMsg'))

  vim.cmd('highlight LspDiagnosticsDefaultHint ' ..pinnacle.decorate('bold,italic', 'Type'))

  vim.cmd('highlight LspDiagnosticsDefaultHintSign ' ..pinnacle.highlight({
    bg = pinnacle.extract_bg('ColorColumn'),
    fg = pinnacle.extract_fg('Type'),
  }))

  vim.cmd('highlight LspDiagnosticsDefaultErrorSign ' ..pinnacle.highlight({
    bg = pinnacle.extract_bg('ColorColumn'),
    fg = pinnacle.extract_fg('ErrorMsg'),
  }))
end

return lsp
