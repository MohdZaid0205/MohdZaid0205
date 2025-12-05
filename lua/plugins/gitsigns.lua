return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- 1. The Icons (Modern Bars)
    signs = {
      add          = { text = "▎" },
      change       = { text = "▎" },
      delete       = { text = "" },
      topdelete    = { text = "" },
      changedelete = { text = "▎" },
      untracked    = { text = "▎" },
    },
    -- 2. Highlights (Link to your theme)
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    
    -- 3. Keymaps (Shortcuts)
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation (Jump to next/prev change)
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "Next Git Change" })

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "Previous Git Change" })

      -- Actions
      map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview Git Change" })
      map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset Hunk (Undo)" })
      map("n", "<leader>gS", gitsigns.stage_hunk, { desc = "Stage Hunk" })
      map("n", "<leader>gb", function() gitsigns.blame_line{full=true} end, { desc = "Blame Line" })
    end,
  },
}