local has_lsp, lspconfig = pcall(require, 'lspconfig')
if not has_lsp then
  return
end

local telescope_mapper = require('nc.telescope.mappings')
local nvim_status = require("lsp-status")


-- _ = require('lspkind').init()

local nnoremap = vim.keymap.nnoremap

require('nc.lsp.status').activate()
require('nc.lsp.handlers')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

-- local custom_init = function(client)
--   client.config = client.config.flags or {}
--   client.config.flags.allow_incremental_sync = true
-- end

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

  nvim_status.on_attach(client)

  nnoremap { "<space>dn", vim.lsp.diagnostic.goto_next, buffer = 0 }
  nnoremap { "<space>dp", vim.lsp.diagnostic.goto_prev, buffer = 0 }
  nnoremap { "<space>sl", vim.lsp.diagnostic.show_line_diagnostics, buffer = 0 }

  nnoremap { "<space>gi", vim.lsp.buf.implementation, buffer = 0}
  nnoremap { "<c-]>", vim.lsp.buf.definition, buffer = 0 }
  nnoremap { "gD", vim.lsp.buf.declaration, buffer = 0 }
  nnoremap { "gr", vim.lsp.buf.references, buffer = 0 }
  nnoremap { "<space>ff", vim.lsp.buf.formatting, buffer = 0 }
  -- nnoremap { "<space>ca", vim.lsp.buf.code_action, buffer = 0 }

  mapper('n', '<space>cr', 'MyLspRename()')


  telescope_mapper('gr', 'lsp_references', {
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    prompt_position = "top",
    ignore_filename = true,
  }, true)

  telescope_mapper('<space>ca', 'lsp_code_actions', nil, true)

  if filetype ~= 'lua' then
    mapper( 'n', 'K', 'vim.lsp.buf.hover()')
  end

  mapper('i', '<c-s>', 'vim.lsp.buf.signature_help()')
  mapper('n', '<space>rr', 'vim.lsp.stop_client(vim.lsp.get_active_clients()); vim.cmd [[e]]')

  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
end

-- local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
-- updated_capabilities.textDocument.codeLens = {
--   dynamicRegistration = false,
-- }

local updated_capabilities = nvim_status.capabilities

local cmd = vim.fn.expand(
'~/code/lua-language-server/bin/macOS/lua-language-server'
)

local main = vim.fn.expand('~/code/lua-language-server/main.lua')

if vim.fn.executable(cmd) == 1 then
  lspconfig.sumneko_lua.setup {
    cmd = { cmd, '-E', main},
    on_attach = custom_attach,
    capabilities = updated_capabilities,
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

lspconfig.tsserver.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities
}

lspconfig.vimls.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities

}

lspconfig.clangd.setup {
  on_attach = custom_attach,
  capabilities = updated_capabilities
}

lspconfig.hls.setup {
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  filetypes = { "haskell", "lhaskell" },
  on_attach = custom_attach,
  capabilities = updated_capabilities
}

-- Diagnostic LSP
local eslint = require('nc.diagnosticls.linters.eslint')
local tslint = require('nc.diagnosticls.linters.tslint')
local prettier = require('nc.diagnosticls.formatters.prettier')
local prettier_standard = require('nc.diagnosticls.formatters.prettier_standard')

lspconfig.diagnosticls.setup {
  -- on_init = custom_init,
  on_attach = custom_attach,
  -- capabilities = lsp_status.capabilities,
  filetypes = {
    "typescript",
    "typescriptreact",
    "sh"
  },
  init_options = {
    linters = {
      tslint = tslint,
      shellcheck = {
        command = "shellcheck",
        debounce = 100,
        args = { "--format=json", "-" },
        sourceName = "shellcheck",
        parseJson = {
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${code}]",
          security = "level"
        },
        securities = {
          error = "error",
          warning = "warning",
          info = "info",
          style = "hint"
        }
      },
    },

    filetypes = {
      typescript = 'tslint',
      typescriptreact = 'tslint',
      sh = 'shellcheck'
    },
    formatters = {
      --   prettier = prettier,
      tslintFix = {
        command = "tslint",
        args = {"%filepath", "--fix" },
        -- rootPatterns = {".git"},
      },
    },
    formatFiletypes = {
      javascript =  'tslintFix',
      javascriptreact = 'tslintFix',
      typescript =  'tslintFix',
      typescriptreact =  'tslintFix'
    }
  }
}
