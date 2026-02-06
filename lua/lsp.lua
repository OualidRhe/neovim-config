-- LSP server configurations using Neovim 0.11+ native API

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Try to enhance capabilities with cmp-nvim-lsp if available
pcall(function()
    local cmp_caps = require("cmp_nvim_lsp").default_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, cmp_caps)
end)

-- Clangd for C/C++
vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_markers = { ".clangd", "compile_commands.json", ".git" },
    capabilities = capabilities,
})

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "package.json", "tsconfig.json", ".git" },
    capabilities = capabilities,
})

-- Lua
vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false,
            },
        },
    },
})

-- Bash
vim.lsp.config("bashls", {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    root_markers = { ".git" },
    capabilities = capabilities,
})

-- Enable LSP servers (jdtls is handled separately in ftplugin/java.lua)
vim.lsp.enable({ "clangd", "ts_ls", "lua_ls", "bashls" })

-- LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Show references" }))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, vim.tbl_extend("force", opts, { desc = "Format code" }))
    end,
})
