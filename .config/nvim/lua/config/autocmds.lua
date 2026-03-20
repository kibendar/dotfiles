-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
--
local function java_template()
  local filepath = vim.fn.expand("%:p")
  local filename = vim.fn.expand("%:t:r")

  -- Detect package from src/main/java/... structure
  local package_name = nil
  local match = filepath:match("src[/\\]main[/\\]java[/\\](.*)[/\\][^/\\]+%.java$")
  if match then
    package_name = match:gsub("[/\\]", ".")
  end

  local lines = {}

  if package_name then
    table.insert(lines, "package " .. package_name .. ";")
    table.insert(lines, "")
  end

  table.insert(lines, "public class " .. filename .. " {")
  table.insert(lines, "")
  table.insert(lines, "}")

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

  local cursor_line = package_name and 4 or 2
  vim.api.nvim_win_set_cursor(0, { cursor_line, 4 })
end

-- nvim <filename>.java from terminal
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.java",
  callback = java_template,
})

-- File created from neo-tree, opened with l or Enter
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.java",
  callback = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local is_empty = #lines == 0 or (#lines == 1 and lines[1] == "")
    if not is_empty then
      return
    end
    java_template()
  end,
})
