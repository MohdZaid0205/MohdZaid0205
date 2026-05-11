return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- Automatically close Trouble when you jump to an error
    auto_close = true, 
  },
keys = {
    -- Added 'focus=true' to instantly jump into the window
    { "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>", desc = "Buffer Diagnostics" },
  },
}