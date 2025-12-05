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
