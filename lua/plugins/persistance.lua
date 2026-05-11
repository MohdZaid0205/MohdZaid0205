return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {},
  keys = {
    { "<leader>os", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>ol", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
  },
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("persistence", { clear = true }),
      callback = function()
        -- Only auto-load if we run 'nvim' or 'nvim .'
        if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
          require("persistence").load()
          
          -- THE FIX: Wait a tiny bit, then force Neovim to realize these are C/Lua files
          vim.schedule(function()
            vim.cmd("silent! bufdo e")
          end)
        end
      end,
    })
  end,
}