require("lsp_signature").setup({
    bind = true,
    handler_opts = {
        border = "rounded", -- options: "single", "double", "rounded", "solid", "shadow"
    },
    hint_enable = false,
    floating_window = true,
    hi_parameter = "LspSignatureActiveParameter",
})
