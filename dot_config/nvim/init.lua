-- Minimal Neovim config for quick edits and git commits

-- Basic settings
vim.opt.number = true                -- Line numbers
vim.opt.relativenumber = true        -- Relative line numbers
vim.opt.mouse = "a"                  -- Enable mouse
vim.opt.clipboard = "unnamedplus"    -- System clipboard
vim.opt.ignorecase = true            -- Case insensitive search
vim.opt.smartcase = true             -- Unless uppercase in search
vim.opt.cursorline = true            -- Highlight current line
vim.opt.expandtab = true             -- Spaces instead of tabs
vim.opt.shiftwidth = 2               -- Indent size
vim.opt.tabstop = 2                  -- Tab size
vim.opt.termguicolors = true         -- True colors
vim.opt.wrap = false                 -- No line wrap
vim.opt.signcolumn = "yes"           -- Always show sign column
vim.opt.scrolloff = 8                -- Lines to keep visible
vim.opt.autowrite = true             -- Auto-save on focus loss
vim.opt.undofile = true              -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

-- Leader key
vim.g.mapleader = " "

-- Essential keymaps
local keymap = vim.keymap.set

-- Save and quit
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
keymap("n", "<leader>x", "<cmd>x<CR>", { desc = "Save and quit" })

-- Better navigation
keymap("n", "<C-d>", "<C-d>zz")  -- Center after scroll down
keymap("n", "<C-u>", "<C-u>zz")  -- Center after scroll up

-- Clear search highlight
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move lines
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Simple colorscheme (no plugins needed)
vim.cmd("colorscheme habamax")

-- Git commit settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 72
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
