-- LSP Configuration for Neovim 0.11+
return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = {
                    "clangd",
                    "ts_ls",
                    "jdtls",
                    "lua_ls",
                    "bashls",
                    "pyright",
                },
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = false,
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "java-debug-adapter",
                    "java-test",
                },
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = {},
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
}
