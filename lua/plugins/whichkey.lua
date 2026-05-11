return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300 -- Wait 300ms before showing the popup
  end,
  opts = {
    preset = "modern",
    -- Optional: You can group your commands so the menu looks organized
    spec = {
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>g", group = "Git" },
      { "<leader>t", group = "Terminal" },
      { "<leader>b", group = "Build" },
      { "<leader>o", group = "Sessions (Persistance)" },
      { "<leader>x", group = "Lsp Errors/Warns" },
    },
  }
}