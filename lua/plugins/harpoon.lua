-- Harpoon for quick file navigation
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        -- Add file to harpoon
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })

        -- Toggle harpoon menu
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

        -- Quick navigation to files 1-9
        for i = 1, 9 do
            vim.keymap.set("n", "<leader>" .. i, function() harpoon:list():select(i) end, { desc = "Harpoon file " .. i })
        end

        -- Navigate prev/next
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon next" })
    end,
}
