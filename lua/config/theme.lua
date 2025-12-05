-- lua/config/theme.lua

-- 1. YOUR PALETTE (Material Darker + #121212)
local colors = {
  bg       = "#121212", -- Your custom background
  fg       = "#eeffff", -- Soft White/Cyan text (Standard Material)
  
  -- The Material "Pastel" Accents (Very easy on eyes)
  red      = "#ff5370",
  green    = "#55ff55",
  yellow   = "#ffcb6b",
  blue     = "#82aaff",
  purple   = "#bb56ff", -- The signature Material keyword color
  cyan     = "#89ddff",
  orange   = "#f78c6c",
  grey     = "#545454",
  
  -- UI Specifics (Tuned for #121212)
  line_bg  = "#1a1a1a", -- Subtle highlight for current line
  selection= "#262626", -- Visual selection background
  border   = "#303030", -- Split borders
}

-- 2. HELPER FUNCTION
local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- 3. UI & EDITOR BASICS
hl("Normal",     { fg = colors.fg, bg = colors.bg })
hl("NormalFloat",{ fg = colors.fg, bg = "#181818" }) -- Popups slightly lighter
hl("Cursor",     { fg = colors.bg, bg = colors.green })
hl("LineNr",     { fg = colors.grey })
hl("CursorLine", { bg = colors.line_bg })
hl("CursorLineNr",{ fg = colors.green, bold = true }) 
hl("Visual",     { bg = colors.selection }) 
hl("VertSplit",  { fg = colors.border })
hl("StatusLine", { fg = colors.fg, bg = "#181818" })

-- 4. SYNTAX HIGHLIGHTING
hl("Comment",    { fg = colors.grey, italic = true })
hl("String",     { fg = colors.green })
hl("Number",     { fg = colors.green })
hl("Boolean",    { fg = colors.orange })
hl("Constant",   { fg = colors.orange })

hl("Keyword",    { fg = colors.purple }) -- function, local, if, else
hl("Statement",  { fg = colors.purple })
hl("Conditional",{ fg = colors.purple })
hl("Repeat",     { fg = colors.purple })

hl("Function",   { fg = colors.blue })
hl("Type",       { fg = colors.yellow })  -- int, class, bool
hl("Identifier", { fg = colors.fg })      -- variable names
hl("Operator",   { fg = colors.cyan })    -- =, +, -
hl("Special",    { fg = colors.cyan })    -- this, self

hl("Error",      { fg = colors.red })
hl("Warning",    { fg = colors.yellow })
hl("Todo",       { fg = colors.bg, bg = colors.yellow, bold = true })

-- 5. SNACKS.NVIM SPECIFIC
hl("SnacksDashboardHeader", { fg = colors.blue })
hl("SnacksDashboardDesc",   { fg = colors.grey })
hl("SnacksDashboardKey",    { fg = colors.red })
hl("SnacksDashboardFooter", { fg = colors.grey })
hl("SnacksDashboardIcon",   { fg = colors.green })
hl("MatchParen",            { fg = colors.yellow, bold = true, underline = true })

-- 6. GIT GUTTER COLORS (Gitsigns)
hl("GitSignsAdd",    { fg = colors.green })  -- Forces your Green (#c3e88d)
hl("GitSignsChange", { fg = colors.blue })   -- Forces your Blue (#82aaff)
hl("GitSignsDelete", { fg = colors.red })    -- Forces your Red (#ff5370)