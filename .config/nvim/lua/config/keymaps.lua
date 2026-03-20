-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<M-h>", "<CMD>NvimTmuxNavigateLeft<CR>", { desc = "Navigate: Left (Tmux)" })
map("n", "<M-j>", "<CMD>NvimTmuxNavigateDown<CR>", { desc = "Navigate: Down (Tmux)" })
map("n", "<M-k>", "<CMD>NvimTmuxNavigateUp<CR>", { desc = "Navigate: Up (Tmux)" })
map("n", "<M-l>", "<CMD>NvimTmuxNavigateRight<CR>", { desc = "Navigate: Right (Tmux)" })

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-b>", "<C-b>zz")

map("v", "p", "P")

map("n", "U", "<C-r>")

map("x", "<leader>p", [["_dP]])

map("i", "<C-c>", "<Esc>")

map("x", ";", ":")
