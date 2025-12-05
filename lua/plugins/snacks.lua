return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    lazygit = { 
      enabled = true,
      configure = true, 
      config = {
        -- Pass extra args to lazygit here if needed
      },
      win = {
        style = "lazygit",
        wo = { 
          wrap = false -- Disables Neovim's soft wrapping in the window
        }, 
      },
    },
    
    picker = {
      enabled = true,
      layout = {
        preset = "ivy",  -- This is the built-in bottom-panel preset
        -- You can tweak the height here if you want it taller/shorter
        cycle = false,   
      },
      -- sources = {
      --    explorer = { layout = { preset = "default" } } -- Keep explorer as sidebar
      -- }
    },

    dashboard = { enabled = true },
    explorer = { 
      enabled = true,
      layout = {
        cycle = false,
      },
    },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },

    statuscolumn = {
      enabled = false,
      left = { "mark", "sign" }, -- Priority on the left
      right = { "fold", "git" }, -- Priority on the right (if splitting)
      
      -- This 'layout' array controls the EXACT order from Left to Right
      layout = {
        { section = "sign", minwidth = 2 },   -- 1. Git Signs/Errors (Leftmost)
        { section = "number", minwidth = 2 }, -- 2. Line Numbers (Right of signs)
        { section = "folds", minwidth = 1 },  -- 3. Fold markers (Optional, usually near text)
      },
    },
    words = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    -- === PICKER SHORTCUTS (Now using Ivy Layout) ===
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Find Files (Smart)" },
    { "<leader>f/",  function() Snacks.picker.files() end, desc = "Find Files (Root)" },
    { "<leader>f.", function() Snacks.picker.grep() end, desc = "Grep (Search Text)" },
    { "<leader>f ", function() Snacks.picker.grep_word() end, desc = "Search Word under cursor" },
    { "<leader>f,",  function() Snacks.picker.buffers() end, desc = "Find Buffers" },
    { "<leader>e",  function() Snacks.explorer() end, desc = "File Explorer" },
    
    -- === GIT SHORTCUTS ===
    -- 1. LazyGit (The most important one)
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Open LazyGit" },
    { "<leader>bb", function() Snacks.lazygit.log() end, desc = "Open LazyGit.lazylog" },
    
    -- 2. Standard Git Operations (via Picker)
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff" },
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Switch Git Branch" },
    
    -- 3. File History (Blame/Log for current file)
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log (Current File)" },
    
    -- === OTHER UTILS ===
    { "<leader>z",  function() Snacks.zen() end, desc = "Zen Mode" },
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Pad" },
    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>c",  function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>th", function() Snacks.picker.colorschemes() end, desc = "Choose Theme" },

    -- for TERMINAL
    { "<leader>tt", function() Snacks.terminal() end,  desc = "Toggle Terminal", mode = { "n", "t" }}
  },
}