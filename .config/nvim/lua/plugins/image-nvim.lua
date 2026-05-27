return {
  "3rd/image.nvim",
  build = false,
  opts = {
    backend   = "kitty", -- Ghostty supports the kitty graphics protocol
    processor = "magick_cli",
    integrations = {
      markdown = {
        enabled                       = true,
        only_render_image_at_cursor   = true,
        download_remote_images        = true,
        clear_in_insert_mode          = true,
      },
      typst = { enabled = true },
      html  = { enabled = false },
      css   = { enabled = false },
    },
    max_height_window_percentage = 40,
    window_overlap_clear_enabled = true,
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
  },
}
