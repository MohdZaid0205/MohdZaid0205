return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    -- This colors the background of the word, leaving the rest of the comment normal
    signs = false, -- Disables the gutter signs (keeps your gutter clean!)
    highlight = {
      multiline = false,
      keyword = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg"
      pattern = [[.*<(KEYWORDS)\s*:]], -- Only highlights if it has a colon like TODO:
    },
  },
  keys = {
    -- Uses Snacks to search your TODOs
    { "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "Find TODOs" },
  }
}