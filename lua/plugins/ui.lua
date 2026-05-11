return {
  -- 1. Fix the Input Boxes (Dressing)
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        -- This tells dressing to NEVER float the input box. 
        -- It will always use the native bottom bar.
        enabled = false, 
      },
      select = {
        -- You can leave this as true if you still want floating menus for 
        -- things like code actions, or set to false to kill those too.
        enabled = true, 
      }
    }
  },
  
  -- 2. Fix the Command Line (Noice)
--   {
--     "folke/noice.nvim",
--     event = "VeryLazy",
--     dependencies = {
--       "MunifTanjim/nui.nvim",
--       "rcarriga/nvim-notify", 
--     },
--     opts = {
--       -- Force the command line to stay at the bottom like a normal terminal
--       cmdline = {
--         view = "cmdline", 
--       },
--       lsp = {
--         override = {
--           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--           ["vim.lsp.util.stylize_markdown"] = true,
--           ["cmp.entry.get_documentation"] = true, 
--         },
--       },
--       presets = {
--         bottom_search = true,         -- Force search (/) to the bottom bar
--         command_palette = false,      -- Disable the center popup for commands
--         long_message_to_split = true, 
--         inc_rename = false,           
--         lsp_doc_border = true,        
--       },
--     }
--   }
}