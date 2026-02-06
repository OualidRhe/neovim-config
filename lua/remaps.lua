-- Keymaps (matching your vimrc where applicable)

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save/quit shortcuts
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":wq<CR>", { noremap = true, silent = true, desc = "Save and quit" })
vim.keymap.set("n", "<leader>qq", ":q!<CR>", { noremap = true, silent = true, desc = "Quit without saving" })

-- Explorer shortcuts
vim.keymap.set("n", "<leader>e.", ":Explore .<CR>", { noremap = true, silent = true, desc = "Explore current dir" })
vim.keymap.set("n", "<leader>eh", ":Explore $HOME<CR>", { noremap = true, silent = true, desc = "Explore home" })
vim.keymap.set("n", "<leader>ed", ":Explore %:h<CR>", { noremap = true, silent = true, desc = "Explore file dir" })
vim.keymap.set("n", "<leader>ec", ":Explore $HOME/.config/nvim<CR>", { noremap = true, silent = true, desc = "Explore nvim config" })

-- Clear search highlight
vim.keymap.set("n", "<leader>/", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear search highlight" })

-- Buffer navigation
vim.keymap.set("n", "<leader>b", ":bprev<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<leader>f", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })

-- Window navigation with Ctrl+hjkl
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" })

-- Copy full file path to clipboard
vim.keymap.set("n", "<leader>cp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.system("xclip -selection clipboard", path)
end, { desc = "Copy full file path to clipboard" })

-- Diagnostic navigation (matching your vimrc)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ float = false }) end, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ float = false }) end, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
