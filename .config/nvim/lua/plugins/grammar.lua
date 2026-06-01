return {
  -- Enhanced ltex-ls integration: per-language word lists, rule toggling
  {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "text", "gitcommit", "rst", "tex", "latex" },
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("ltex_extra").setup({
        -- Persist added words / disabled rules per language
        load_langs = { "en-US", "uk-UA", "ru-RU" },
        init_check = true,
        path = vim.fn.stdpath("data") .. "/ltex",
        log_level = "none",
        server_opts = {
          cmd = { "ltex-ls-plus" },
          settings = {
            ltex = {
              -- Auto-detect language from buffer content
              language = "auto",
              additionalRules = {
                enablePickyRules = false,
                -- Treats English as the user's native language;
                -- improves suggestions for false-positive suppression
                motherTongue = "en-US",
              },
              -- Check on save to avoid constant CPU churn while typing
              checkFrequency = "save",
            },
          },
        },
      })
    end,
  },
}
