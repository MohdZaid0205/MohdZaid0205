return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    indent = {
      char = "│", -- A sleek, solid vertical line
      tab_char = "│",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      -- Highlights the indentation line of your current block
      highlight = { "Function", "Label" }, 
    },
  }
}