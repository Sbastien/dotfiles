-- Minimal Neovim config for quick edits and git commits

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true             -- overrides ignorecase when the search has capitals
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"     -- ANSI 16 has no shade subtle enough for the row
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- No colorscheme line follows: of the schemes that ship, only the default keeps
-- every cterm value inside the terminal's sixteen.
vim.opt.termguicolors = false
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

-- The default colorscheme gives cterm values to eight groups and leaves the rest
-- gui-only, so Comment renders in the plain foreground. `:hi Comment` shows it.
for group, attrs in pairs({
  Comment = { ctermfg = 8 },
  NonText = { ctermfg = 8 },
  Delimiter = { ctermfg = 8 },
  LineNr = { ctermfg = 8 },
  CursorLineNr = { ctermfg = 11, bold = true },
  Constant = { ctermfg = 13 },
  Number = { ctermfg = 13 },
  Boolean = { ctermfg = 13 },
  Float = { ctermfg = 13 },
  Statement = { ctermfg = 11, bold = true },
  Keyword = { ctermfg = 11, bold = true },
  Conditional = { ctermfg = 11 },
  Repeat = { ctermfg = 11 },
  Exception = { ctermfg = 11 },
  Type = { ctermfg = 2 },
  PreProc = { ctermfg = 5 },
  Include = { ctermfg = 5 },
  Define = { ctermfg = 5 },
  Macro = { ctermfg = 5 },
  Todo = { ctermfg = 0, ctermbg = 11, bold = true },
  MatchParen = { ctermbg = 8, bold = true },
  -- Reverse fills the bar whatever the palette; no colour can.
  StatusLine = { cterm = { reverse = true, bold = true } },
}) do
  vim.api.nvim_set_hl(0, group, attrs)
end

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
