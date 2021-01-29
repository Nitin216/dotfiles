-- Replicated wincent/.vim/lua/wincent/lsp.lua
local lsp = {}
local completion = require('completion')
local lsp_status = require('lsp-status')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local setup_custom_diagnostics = function()

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with {
    should_underline = true,
    update_in_insert = false
  }

  mapper(
    'n',
    '<leader>dn',
    '<cmd>lua vim.lsp.structures.Diagnostic.buf_move_next_diagnostic()<CR>'
  )


  mapper(
    'n',
    '<leader>dp',
    '<cmd>lua vim.lsp.structures.Diagnostic.buf_move_prev_diagnostic()<CR>'
  )
end

local custom_attach = function(client)
  completion.on_attach(client)

  if false then
    pcall(setup_custom_diagnostics)
  end


  mapper('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  mapper('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  mapper('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  mapper('n', '<space>cr', '<cmd>lua vim.lsp.buf.rename()<CR>')
  mapper('n', '<space>sl', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
  mapper('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  mapper('n', '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>')

  -- if not vim.api.nvim_buf_get_keymap(0, 'n')['K'] then
  if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'lua' then
    mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  end

  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

lsp.init = function()

  local cmd = vim.fn.expand(
    '~/code/lua-language-server/bin/macOS/lua-language-server'
  )

  local main = vim.fn.expand('~/code/lua-language-server/main.lua')

  if vim.fn.executable(cmd) == 1 then
    require('lspconfig').sumneko_lua.setup {
      cmd = { cmd, '-E', main},
      on_attach = custom_attach,
      capabilities = lsp_status.capabilities,
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
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx"
    },
    capabilities = lsp_status.capabilities,
    on_attach = custom_attach,
  }

  require('lspconfig').vimls.setup {
    capabilities = lsp_status.capabilities,
    on_attach = custom_attach
  }

  require('lspconfig').clangd.setup {
    capabilities = lsp_status.capabilities,
    on_attach = custom_attach
  }

  require('lspconfig').hls.setup {
    capabilities = lsp_status.capabilities,
    on_attach = custom_attach
  }

  -- Diagnostic LSP
  local eslint = require('nc.diagnosticls.linters.eslint')
  local prettier = require('nc.diagnosticls.formatters.prettier')
  local prettier_standard = require('nc.diagnosticls.formatters.prettier_standard')

  require('lspconfig').diagnosticls.setup {
    on_attach = custom_attach,
    capabilities = lsp_status.capabilities,
    filetypes = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact"
    },
    init_options = {
      linters = {
        eslint = eslint
      },
      formatFiletypes = {
        javascript = 'prettier',
        javascriptreact = 'prettier',
        typescript = 'prettier',
        typescriptreact = 'prettier'
      },
      formatters = {
        prettier = prettier,
        prettier_standard = prettier_standard
      }
    }
  }

  -- Overide hover highlight
  local method = 'textDocument/hover'
  local hover = vim.lsp.callbacks[method]
  vim.lsp.handlers[method] = function (_, method, result)
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
