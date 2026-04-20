local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#1f1f28", -- Default Background
    base01 = "#2a2a37", -- Lighter Background (status bars)
    base02 = "#333343", -- Selection Background
    base03 = "#526e7c", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#c8c093", -- Dark Foreground (status bars)
    base05 = "#dcd7ba", -- Default Foreground
    base06 = "#dcd7ba", -- Light Foreground
    base07 = "#dcd7ba", -- Lightest Foreground
    -- Accent colors
    base08 = "#c4746e", -- Variables, XML Tags, Errors
    base09 = "#938aa9", -- Integers, Constants
    base0A = "#8ea49e", -- Classes, Search Background
    base0B = "#c4b28a", -- Strings, Diff Inserted
    base0C = "#ae96e9", -- Regex, Escape Chars
    base0D = "#e9cf96", -- Functions, Methods
    base0E = "#96e9d2", -- Keywords, Storage
    base0F = "#64201b", -- Deprecated, Embedded Tags
  })
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M
