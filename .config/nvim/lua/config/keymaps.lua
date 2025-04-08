-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>")
vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNext<CR>")

-- Move selection down and up in Visual Mode with J, K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Stay at middle of the screen while searching and moving
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zzzv")
vim.keymap.set("n", "#", "#zzzv")

vim.keymap.set("n", "cn", "*Ncgn")

vim.keymap.set("n", "zj", "o<Esc>k", { desc = "Add new line below" })
vim.keymap.set("n", "zk", "O<Esc>j", { desc = "Add new line behigh" })

-- Redo with U
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- IntelliJ like keymap
vim.keymap.set("n", "<C-M-l>", vim.lsp.buf.format)

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
