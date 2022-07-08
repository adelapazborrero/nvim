local present, lspconfig = pcall(require, "lspconfig")

if not present then
    return
end

require("base46").load_highlight "lsp"

local M = {}
local utils = require "core.utils"

local function saveOnFormating(client, bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
        -- format on save
        vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end

    if client.resolved_capabilities.document_range_formatting then
        vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
end

require "ui.lsp"

lspconfig.volar.setup {
    on_attach = function(client, bufnr)
        saveOnFormating(client, bufnr)
    end,
}

lspconfig.tsserver.setup {
    on_attach = function(client, bufnr)
        saveOnFormating(client, bufnr)
    end,
}

lspconfig.intelephense.setup {
    on_attach = function(client, bufnr)
        saveOnFormating(client, bufnr)
    end,
}

M.on_attach = function(client, bufnr)
    local vim_version = vim.version()

    if vim_version.minor > 7 then
        -- nightly
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
    else
        -- stable
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.document_range_formatting = true
    end

    local lsp_mappings = utils.load_config().mappings.lspconfig
    utils.load_mappings({ lsp_mappings }, { buffer = bufnr })
    vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")

    if client.server_capabilities.signatureHelpProvider then
        require("nvchad.ui.signature").setup(client)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

lspconfig.sumneko_lua.setup {
    on_attach = M.on_attach,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
}

local null_ls = require("null-ls")
local prettier = require("prettier")

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
            -- format on save
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
        end

        if client.resolved_capabilities.document_range_formatting then
            vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
        end
    end,
})

prettier.setup({
    bin = 'prettier', -- or `prettierd`
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },

    -- prettier format options (you can use config files too. ex: `.prettierrc`)
    arrow_parens = "always",
    bracket_spacing = true,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_quote = false,
    tab_width = 4,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = false,
})

-- requires a file containing user's lspconfigs
local addlsp_confs = utils.load_config().plugins.options.lspconfig.setup_lspconf

if #addlsp_confs ~= 0 then
    require(addlsp_confs).setup_lsp(M.on_attach, capabilities)
end

return M
