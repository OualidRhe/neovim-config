-- Treesitter for better syntax highlighting
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 900,
    config = function()
        require("nvim-treesitter").setup()

        -- Enable treesitter highlighting automatically
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
