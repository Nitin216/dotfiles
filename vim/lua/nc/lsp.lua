-- Replicated wincent/.vim/lua/wincent/lsp.lua
local lsp = {}
local completion = require('completion')
local lsp_status = require('lsp-status')

require('nc.lsp_handlers')

-- Have to make changes in neovim core for this
-- local nnoremap = vim.keymap.nnoremap

local custom_attach = function(client, bufnr)
    completion.on_attach(client)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_options(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_options('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {noremap = true, silent = true}

    buf_set_keymap('n', '<space>dn', '<cmd> lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<space>sl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<c-]', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

    buf_set_keymap ('n', '<space>cr', '<cmd>lua MyLspRename()<CR>', opts)

    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'lua' then
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end

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
    -- local method = 'textDocument/hover'
    -- local hover = vim.lsp.callbacks[method]
    -- vim.lsp.handlers[method] = function (_, _, result)
    --     hover(_, _, result)

    --     for _, winnr in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    --         if pcall(function ()
    --             vim.api.nvim_win_get_var(winnr, 'textDocument/hover')
    --         end) then
    --         vim.api.nvim_wins_set_option(winnr, 'winhighlight', 'Normal:Visual,NormalNC:Visual')
    --         break
    --     else
    --         -- Not a hover window
    --     end
    -- end
end

lsp.setup_highlights = function()
    local pinnacle = require'wincent.pinnacle'

    vim.cmd('highlight LspDiagnosticsDefaultHint ' ..pinnacle.decorate('bold,italic', 'ModeMsg'))

    vim.cmd('highlight LspDiagnosticsDefaultError ' ..pinnacle.decorate('italic', 'ErrorMsg'))

    vim.cmd('highlight LspDiagnosticsDefaultWarning ' ..pinnacle.decorate('bold,italic', 'Type'))

    vim.cmd('highlight LspDiagnosticsSignHint ' ..pinnacle.highlight({
        bg = pinnacle.extract_bg('ColorColumn'),
        fg = pinnacle.extract_fg('ModeMsg'),
    }))

    vim.cmd('highlight LspDiagnosticsSignError ' ..pinnacle.highlight({
        bg = pinnacle.extract_bg('ColorColumn'),
        fg = pinnacle.extract_fg('ErrorMsg'),
    }))

    vim.cmd('highlight LspDiagnosticsSignWarning ' ..pinnacle.highlight({
        bg = pinnacle.extract_bg('ColorColumn'),
        fg = pinnacle.extract_fg('Type'),
    }))
end

return lsp
