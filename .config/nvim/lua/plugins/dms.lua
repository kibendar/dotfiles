-- DankMaterialShell theming.
--
-- DMS regenerates two files on every wallpaper/theme change:
--   ~/.config/nvim/colors/dms.lua              (the colorscheme)
--   ~/.config/nvim/lua/lualine/themes/dms.lua  (matching statusline)
-- Both are auto-generated -- do not edit them, DMS overwrites them.
--
-- colors/dms.lua installs its own fs_event watcher on itself and on DMS's
-- settings.json, so a running nvim recolors live; no restart needed.
--
-- Palette knobs (base theme, harmony, light/dark) live in DMS Settings, under
-- matugenTemplateNeovimSettings in ~/.config/DankMaterialShell/settings.json.
return {
  {
    "AvengeMedia/base46",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dms",
    },
  },
}
