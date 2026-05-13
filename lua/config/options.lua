-- LEADER KEYS (Must be set first)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- VISUAL BASICS
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Relative numbers (good for jumping: '5j', '10k')
vim.opt.signcolumn = "yes"        -- Keep space for git signs/linting (prevents shifting)
vim.opt.termguicolors = true      -- Enable 24-bit RGB colors
vim.opt.wrap = false              -- Disable line wrapping (cleaner code view)
vim.opt.scrolloff = 8             -- Keep 8 lines of context above/below cursor when scrolling
vim.opt.cursorline = true         -- highlighting for current line

-- TAB & INDENTATION (The "Spaces vs Tabs" handling)
vim.opt.tabstop = 4               -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4           -- Number of spaces that a <Tab> counts for while editing
vim.opt.shiftwidth = 4            -- Size of an indent
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.smartindent = true        -- Insert indents automatically on new lines

-- SEARCHING
vim.opt.ignorecase = true         -- Ignore case when searching...
vim.opt.smartcase = true          -- ...unless you type a capital letter
vim.opt.hlsearch = true           -- Highlight all search matches
vim.opt.incsearch = true          -- Show search matches as you type

-- SYSTEM & SAFETY
vim.opt.clipboard = "unnamedplus" -- Sync with Windows system clipboard
vim.opt.undofile = true           -- Save undo history to a file (Undo works after restarting Nvim!)
vim.opt.swapfile = false          -- Disable annoying .swp files
vim.opt.backup = false            -- Disable backup files
vim.opt.updatetime = 250          -- Faster completion/updates (default is 4000ms)
vim.opt.splitright = true         -- Vertical splits open to the right
vim.opt.splitbelow = true         -- Horizontal splits open to the bottom

-- BUILD & PROJECT BASED BUILD
vim.o.exrc = true                 -- Allow loading local config files
vim.o.secure = true               -- Disable shell commands in those files
-- Ensure Neovim saves enough info for the session to be useful

-- Check if the system is Windows
if vim.fn.has("win32") == 1 then
  vim.opt.shell = "powershell"
  
  -- (Optional but Recommended) 
  -- These flags make PowerShell run faster in Neovim and fix text encoding bugs
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
else
  -- If it is Linux or macOS, Neovim is smart enough to automatically 
  -- use your default system shell (like bash or zsh). 
  -- You don't need to set anything at all!
end

-- Variable to remember the command for the current Neovim session
local my_build_cmd = nil

-- The main build trigger
vim.keymap.set("n", "<leader>b.", function()
  if not my_build_cmd then
    local input = vim.fn.input("Enter Build Command: ")
    
    vim.cmd("normal! :") 

    if input and input ~= "" then
      my_build_cmd = input
      Snacks.terminal(my_build_cmd)
    end
  else
    Snacks.terminal(my_build_cmd)
  end
end, { desc = "Run Build Command" })

-- A reset button
vim.keymap.set("n", "<leader>b/", function()
  my_build_cmd = nil
  print("Build command cleared! Press <leader>b to set a new one.")
end, { desc = "Reset Build Command" })
