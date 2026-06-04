-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.spelllang = { "en", "uk", "ru" }
vim.opt.spellfile = {
  vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
  vim.fn.stdpath("config") .. "/spell/uk.utf-8.add",
  vim.fn.stdpath("config") .. "/spell/ru.utf-8.add",
}

-- Wayland clipboard hardening.
-- Neovim runs the clipboard provider synchronously on its main thread. The
-- default `wl-paste` blocks *indefinitely* when the clipboard's owning app has
-- closed or stalls (and no clipboard manager is running to take over), which
-- freezes Neovim hard — must-kill. This is frequently triggered by tmux
-- focus-events when switching panes: the focus event causes a `+` register read
-- -> wl-paste -> deadlock.
-- Fix: wrap wl-paste in `timeout` so a stuck read returns empty after 1s instead
-- of hanging forever, and set cache_enabled so Neovim skips the external read
-- when it set the clipboard itself (far fewer wl-paste calls).
if vim.env.WAYLAND_DISPLAY and vim.fn.executable("wl-copy") == 1 then
  vim.g.clipboard = {
    name = "wl-clipboard (timeout-guarded)",
    copy = {
      ["+"] = { "wl-copy", "--type", "text/plain" },
      ["*"] = { "wl-copy", "--primary", "--type", "text/plain" },
    },
    paste = {
      ["+"] = { "sh", "-c", "timeout 1 wl-paste --no-newline || true" },
      ["*"] = { "sh", "-c", "timeout 1 wl-paste --primary --no-newline || true" },
    },
    cache_enabled = 1,
  }
end

vim.opt.guicursor = table.concat({
  "n-v-c:block", -- Normal/Visual/Command: solid block
  "i-ci-ve:blinkon1-blinkoff1-blinkwait1-block-Cursor", -- Insert: blinking block
  "r-cr:hor20", -- Replace: horizontal bar
  "o:hor50",
}, ",")
