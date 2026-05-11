return {
  -- Requires Nerd Fonts for the icons!
  { "nvim-tree/nvim-web-devicons", lazy = true },

--   -- The Tabs at the top
--   {
--     "akinsho/bufferline.nvim",
--     event = "VeryLazy",
--     opts = {
--       options = {
--         mode = "buffers",
--         separator_style = "slant", -- "slant", "thick", "thin"
--         always_show_bufferline = false,
--         show_buffer_close_icons = false,
--         show_close_icon = false,
--         -- Customizing colors to match your Material Darker theme
--         custom_areas = {
--           right = function()
--             return { { text = " " } }
--           end,
--         },
--       },
--     },
--   },

  -- The Statusline at the bottom
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto", -- Will automatically inherit your custom #121212 colors
        globalstatus = true, -- One single statusline at the bottom, even with split windows
        component_separators = { left = '│', right = '│'},
        section_separators = { left = '', right = ''},
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    }
  }
}