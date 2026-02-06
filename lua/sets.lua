-- Compatibility shim for telescope (ft_to_lang removed in nvim 0.11)
vim.treesitter.language.ft_to_lang = function(ft)
    local lang = vim.treesitter.language.get_lang(ft)
    return lang or ft
end

-- Editor settings (matching your vimrc)

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab/indent settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show whitespace
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Keep cursor centered
vim.opt.scrolloff = 10

-- Update time for CursorHold
vim.opt.updatetime = 100

-- Completion options
vim.opt.completeopt = "menu,menuone,noselect"

-- WSL clipboard integration
vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
        ["+"] = 'clip.exe',
        ["*"] = 'clip.exe',
    },
    paste = {
        ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
}

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Custom diagnostic highlights (matching your vimrc)
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#ff6b6b" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#ffd93d" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "#6bcbff" })
        vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#95e1d3" })
    end,
})

-- Diagnostic signs (matching your vimrc)
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E>",
            [vim.diagnostic.severity.WARN] = "W>",
            [vim.diagnostic.severity.INFO] = "I>",
            [vim.diagnostic.severity.HINT] = "H>",
        },
    },
    virtual_text = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Show diagnostic message on cursor hold (like your vim setup)
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
        if #diagnostics > 0 then
            local msg = diagnostics[1].message:gsub("\n", " ")
            local severity = diagnostics[1].severity
            local prefix = ({ "E: ", "W: ", "I: ", "H: " })[severity]
            vim.api.nvim_echo({{ prefix .. msg, "DiagnosticError" }}, false, {})
        end
    end,
})

-- Clear diagnostic message when cursor leaves error line
vim.api.nvim_create_autocmd("CursorMoved", {
    callback = function()
        local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
        if #diagnostics == 0 then
            vim.api.nvim_echo({}, false, {})
        end
    end,
})
