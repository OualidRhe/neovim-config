-- Keymaps (matching your vimrc where applicable)

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save/quit shortcuts
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":wq<CR>", { noremap = true, silent = true, desc = "Save and quit" })
vim.keymap.set("n", "<leader>qq", ":q!<CR>", { noremap = true, silent = true, desc = "Quit without saving" })


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

-- Copy selection to system clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true, desc = "Copy selection to clipboard" })

-- Copy full file path to clipboard
vim.keymap.set("n", "<leader>cp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.system("xclip -selection clipboard", path)
end, { desc = "Copy full file path to clipboard" })

-- Quick mark: <leader>m to set, <leader>- to jump back
vim.keymap.set("n", "<leader>+", "ma", { noremap = true, silent = true, desc = "Set mark" })
vim.keymap.set("n", "<leader>-", "`a", { noremap = true, silent = true, desc = "Jump to mark" })

-- Move lines up/down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

-- Diagnostic navigation (matching your vimrc)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ float = false }) end, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ float = false }) end, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
