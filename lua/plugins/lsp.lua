-- SILENCE THE DEPRECATION WARNING GLOBALLY
-- This stops the yellow "lspconfig framework is deprecated" popup before it even starts.
vim.g.lspconfig_suppress_deprecation_warning = true

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- 1. Setup Mason
      require("mason").setup({
        ui = { border = "rounded" }
      })
      
      -- 2. Setup Mason-LSPConfig (Just to ensure they are installed)
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd" },
      })
    end,
  },
}