-- Minimal Neovim config for quick edits and git commits

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true             -- overrides ignorecase when the search has capitals
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8                -- lines kept visible above and below the cursor
vim.opt.autowrite = true             -- writes on :make, :!, and buffer switches; not on focus loss
vim.opt.undofile = true

vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
keymap("n", "<leader>x", "<cmd>x<CR>", { desc = "Save and quit" })

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

vim.cmd("colorscheme habamax")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 72
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank({ timeout = 200 })
  end,
})
