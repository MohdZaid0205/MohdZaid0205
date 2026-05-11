return {
  "mbbill/undotree",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undo Tree" },
  },
  init = function()
    -- Tells Neovim to save your undo history to a file
    -- so you can undo changes even after you close and reopen Neovim!
    vim.opt.undofile = true
    vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
  end
}