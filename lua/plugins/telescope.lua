-- Telescope - Fuzzy finder
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
        { "<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
        { "<leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
        { "<C-p>", function() require("telescope.builtin").find_files() end, desc = "Find files" },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                    },
                },
            },
        })
    end,
}
