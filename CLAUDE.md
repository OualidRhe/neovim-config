# Neovim Configuration

Neovim 0.11+ config with LSP support, migrated from vim.

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── ftplugin/
│   └── java.lua          # Java LSP (jdtls) config
└── lua/
    ├── sets.lua          # Editor settings
    ├── remaps.lua        # Keymaps
    ├── lsp.lua           # LSP server configs (native 0.11 API)
    ├── lazy_engine.lua   # Lazy.nvim bootstrap
    └── plugins/
        ├── init.lua          # Colorscheme
        ├── lsp_config.lua    # Mason + tools
        ├── completions.lua   # nvim-cmp setup
        ├── treesitter.lua    # Syntax highlighting
        ├── debugging.lua     # nvim-dap
        └── nvim-jdtls.lua    # Java plugin spec
```

## LSP Servers

Configured via `vim.lsp.config()` (Neovim 0.11 native API):
- **clangd** - C/C++
- **ts_ls** - TypeScript/JavaScript
- **lua_ls** - Lua
- **bashls** - Bash
- **jdtls** - Java (via nvim-jdtls in ftplugin)

## Keymaps

Leader: `<Space>`

### LSP
- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Show references
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action
- `<leader>cf` - Format code

### Diagnostics
- `[d` / `]d` - Previous/next diagnostic
- `<leader>e` - Show diagnostic float

### Java-specific
- `<leader>jo` - Organize imports
- `<leader>jv` - Extract variable
- `<leader>jc` - Extract constant
- `<leader>jm` - Extract method
- `<leader>jt` - Test nearest method
- `<leader>jT` - Test class

### Debugging
- `<leader>dt` - Toggle breakpoint
- `<leader>dc` - Continue/start
- `<leader>di` - Step into
- `<leader>do` - Step over
- `<leader>dO` - Step out
- `<leader>du` - Toggle DAP UI

### Telescope
- `Ctrl+p` or `<leader>ff` - Find files
- `<leader>fg` - Live grep (search text)
- `<leader>fb` - Buffers
- `<leader>fr` - Recent files
- `<leader>fh` - Help tags
- `<leader>fd` - Diagnostics
- `<leader>fc` - Git commits
- `<leader>fs` - Git status

### Git (Fugitive)
- `<leader>gs` - Git status
- `<leader>gd` - Git diff
- `<leader>gb` - Git blame
- `<leader>gl` - Git log

### Harpoon
- `<leader>a` - Add file to harpoon
- `Ctrl+e` - Toggle harpoon menu
- `<leader>1-9` - Jump to harpoon file 1-9
- `Ctrl+Shift+P/N` - Previous/next harpoon file

### General
- `<leader>w` - Save
- `<leader>q` - Save and quit
- `<leader>qq` - Quit without saving
- `<leader>/` - Clear search highlight
- `<leader>b` / `<leader>f` - Previous/next buffer
- `Ctrl+h/j/k/l` - Window navigation

## Diagnostics

- Shows diagnostic message in command line when cursor is on error line
- Signs: `E>`, `W>`, `I>`, `H>`
- updatetime: 100ms
