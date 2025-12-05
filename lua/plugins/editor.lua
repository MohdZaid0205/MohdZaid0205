return {
  -----------------------------------------------------------------------------
  -- 1. MULTIPLE CURSORS (The "VS Code" feature)
  -- Usage: Select words with <C-n> (Ctrl + n), then type to change all of them.
  -----------------------------------------------------------------------------
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      -- This plugin maps <C-n> by default to start selecting matching words
    end,
  },

  -----------------------------------------------------------------------------
  -- 2. AUTO FORMATTING (Prettier, clang-format, etc.)
  -----------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Manual format shortcut: <leader>fm
        "<leader>fm",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      -- Define which formatter to use for which file type
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        cpp = { "clang-format" }, -- Essential for C++
        c = { "clang-format" },
      },
      -- Enable "Format on Save"
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  -----------------------------------------------------------------------------
  -- 3. SURROUND (Modify quotes/brackets easily)
  -- Usage: 
  --  ysiw"  -> Surround Inner Word with " (hello -> "hello")
  --  cs"'   -> Change Surrounding " to '  ("hello" -> 'hello')
  --  ds"    -> Delete Surrounding "       ("hello" -> hello)
  -----------------------------------------------------------------------------
  {
    "kylechui/nvim-surround",
    version = "*", 
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end
  },

  -----------------------------------------------------------------------------
  -- 4. AUTOPAIRS (Auto-close brackets and quotes)
  -----------------------------------------------------------------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
    -- automatically types ) when you type (
  },

  -----------------------------------------------------------------------------
  -- 5. COMMENTS (Easy toggling)
  -- Usage: 
  --  gcc -> Comment current line
  --  gc  -> Comment selected text (Visual mode)
  -----------------------------------------------------------------------------
  {
    "numToStr/Comment.nvim",
    opts = {
        -- add any options here
    },
    lazy = false,
  }
}