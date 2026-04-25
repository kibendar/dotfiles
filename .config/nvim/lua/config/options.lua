-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.guicursor = table.concat({
  "n-v-c:block", -- Normal/Visual/Command: solid block
  "i-ci-ve:blinkon1-blinkoff1-blinkwait1-block-Cursor", -- Insert: blinking block
  "r-cr:hor20", -- Replace: horizontal bar
  "o:hor50",
}, ",")
