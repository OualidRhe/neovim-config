-- Load editor settings
require("sets")

-- Load keymaps
require("remaps")

-- Bootstrap and load lazy.nvim plugin manager
require("lazy_engine")

-- Load plugins
require("lazy").setup("plugins")

-- Load LSP configurations (Neovim 0.11+ native API)
require("lsp")
