return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>ee", "<cmd>Neotree reveal toggle<CR>", desc = "Toggle file explorer" },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "oil://*",
      callback = function()
        require("neo-tree.sources.manager").refresh("filesystem")
      end,
    })
  end,
  opts = {
    close_if_last_window = true,
    filesystem = {
      follow_current_file = { enabled = false },
      use_libuv_file_watcher = true,
    },
    window = {
      width = 35,
      mappings = {
        ["<cr>"] = "open",
        ["l"] = "open",
        ["h"] = "close_node",
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          added = "+",
          modified = "~",
          deleted = "x",
          renamed = "r",
          untracked = "?",
          ignored = "i",
          unstaged = "u",
          staged = "s",
          conflict = "!",
        },
      },
    },
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}
