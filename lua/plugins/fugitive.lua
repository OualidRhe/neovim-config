-- Fugitive - Git integration
return {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gstatus", "Gblame", "Gpush", "Gpull", "Gdiff" },
    keys = {
        { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
        { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff" },
        { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
        { "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
    },
}
