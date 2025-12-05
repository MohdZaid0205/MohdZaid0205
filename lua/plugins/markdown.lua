return {
  -- 1. Configure Treesitter (The Engine)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- We add to the existing ensure_installed table safely
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
      else
        opts.ensure_installed = { "markdown", "markdown_inline" }
      end
    end,
  },

  -- 2. Configure markdown.nvim (The Features)
  {
    "tadmccorkle/markdown.nvim",
    ft = { "markdown", "markdown_inline" }, -- Load only on markdown files
    opts = {
      -- Configuration for tadmccorkle/markdown.nvim goes here
      -- Example:
      on_attach = function(bufnr)
        local map = vim.keymap.set
        local opts = { buffer = bufnr }
        map({ "n", "i" }, "<M-l>", "<Cmd>MDListItemBelow<CR>", opts)
        map({ "n", "i" }, "<M-L>", "<Cmd>MDListItemAbove<CR>", opts)
      end,
    },
  },

  -- 3. Render Markdown (Make it look pretty inside Neovim)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- mini.nvim is optional but recommended
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      -- Optional: Keymap to toggle it on/off
      vim.keymap.set('n', '<leader>mp', require('render-markdown').toggle, { desc = 'Toggle Markdown Render' })
    end,
  },
}
