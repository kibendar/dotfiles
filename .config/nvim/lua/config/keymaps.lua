-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

vim.api.nvim_create_user_command("SpellAddAll", function()
  local save = vim.fn.getcurpos()
  vim.cmd("normal! gg")
  while true do
    local bw = vim.fn.spellbadword()
    if bw[0] == "" then
      break
    end
    vim.cmd("normal! zg")
  end
  vim.fn.setpos(".", save)
end, { desc = "Add all misspelled words to spellfile" })

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

map("x", "<leader>tv", "<CMD>Translate RU<CR>", { desc = "Translate highlighted text" })

map("n", "<leader>sA", "<cmd>SpellAddAll<cr>", { desc = "Spell: Add all to spellfile" })

-- Smart zg: detect language by Cyrillic script and route to the correct spell file.
-- Spellfile order: 1=en.utf-8.add  2=uk.utf-8.add  3=ru.utf-8.add
map("n", "zg", function()
  local word = vim.fn.expand("<cword>")
  if vim.fn.matchstr(word, "[іїєґІЇЄҐ]") ~= "" then
    -- Ukrainian-specific letters found
    vim.cmd("normal! 2zg")
  elseif vim.fn.matchstr(word, "[а-яА-Я]") ~= "" then
    -- Cyrillic (Russian-specific or ambiguous) — default to Russian
    vim.cmd("normal! 3zg")
  else
    vim.cmd("normal! zg")
  end
end, { desc = "Spell: Add word to correct language file" })
