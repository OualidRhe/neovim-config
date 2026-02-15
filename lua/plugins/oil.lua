return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
    { "<leader>eo", function() require("oil").open(vim.fn.expand("%:p:h")) end, desc = "Open oil in file directory" },
  },
  opts = {
    default_file_explorer = true,
    columns = { "icon" },
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["q"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
    },
  },
}
