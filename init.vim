" --------------------------- General Settings ------------------------------
set number                      " Show absolute line numbers
set clipboard=unnamedplus       " Use system clipboard
set mouse=a                     " Enable mouse
set hidden                      " Allow background buffers
set encoding=utf-8              " UTF-8 encoding
set termguicolors               " Enable 24-bit RGB colors
set relativenumber              " Enable relative line numbers
set number                 " Enable absolute line number for the current line
set cursorline                  " Enable maintaining of terminal cursor line
set signcolumn=yes              " sign column for git add remove or diff

" ------------------------- Tabs & Indentation ------------------------------
set tabstop=4                   " Tabs = 4 spaces
set shiftwidth=4                " Indent = 4 spaces
set expandtab                   " Use spaces instead of tabs
set autoindent                  " Copy indent from current line
set smartindent                 " Smart indenting
set nowrap
let mapleader = " "

" -------------------------------- Search -----------------------------------
set ignorecase                  " Case-insensitive searching...
set smartcase                   " ...unless there's a capital
set incsearch                   " Show match as you type
set hlsearch                    " Highlight matches
nnoremap <Space> :noh<CR>       " Space clears highlight

" ---------------------------- Appearance -----------------------------------
syntax on                       " Enable syntax highlighting
set background=dark             " Good for dark terminals
set signcolumn=yes              " sign column to display git diff
" --------------------------- Filetype Settings -----------------------------
filetype plugin indent on

" ----------------------------- Color Thesme --------------------------------
syntax on

" Custom Catppuccin Mocha highlights
highlight Normal       guifg=#cdd6f4 guibg=NONE
highlight Comment      guifg=#585b70
highlight Constant     guifg=#f5e0dc
highlight String       guifg=#a6e3a1
highlight Character    guifg=#f9e2af
highlight Number       guifg=#f9e2af
highlight Boolean      guifg=#f38ba8
highlight Identifier   guifg=#b4befe
highlight Function     guifg=#cba6f7
highlight Statement    guifg=#89b4fa
highlight Conditional  guifg=#89b4fa
highlight Repeat       guifg=#89b4fa
highlight Operator     guifg=#89dceb
highlight Keyword      guifg=#89b4fa
highlight Type         guifg=#f2cdcd
highlight Special      guifg=#94e2d5
highlight Todo         guifg=#fab387 guibg=NONE

set termguicolors


" ------------------------------- Load Plugins ------------------------------
call plug#begin('~/.local/share/nvim/plugged')

"Install using:>
"curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
Plug 'airblade/vim-gitgutter'       " git gutter plugin for nvim
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'                 " Required dependency for telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" ------------------------- Tree-sitter Setup -------------------------------
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  indent = { enable = true },
}

-- link Tree-sitter groups to your existing highlight colors
vim.api.nvim_set_hl(0, "@comment",      { link = "Comment" })
vim.api.nvim_set_hl(0, "@constant",     { link = "Constant" })
vim.api.nvim_set_hl(0, "@string",       { link = "String" })
vim.api.nvim_set_hl(0, "@character",    { link = "Character" })
vim.api.nvim_set_hl(0, "@number",       { link = "Number" })
vim.api.nvim_set_hl(0, "@boolean",      { link = "Boolean" })
vim.api.nvim_set_hl(0, "@function",     { link = "Function" })
vim.api.nvim_set_hl(0, "@keyword",      { link = "Keyword" })
vim.api.nvim_set_hl(0, "@type",         { link = "Type" })
vim.api.nvim_set_hl(0, "@operator",     { link = "Operator" })
vim.api.nvim_set_hl(0, "@conditional",  { link = "Conditional" })
vim.api.nvim_set_hl(0, "@repeat",       { link = "Repeat" })
vim.api.nvim_set_hl(0, "@special",      { link = "Special" })
vim.api.nvim_set_hl(0, "@todo",         { link = "Todo" })
EOF


" Telescope key bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>

" Telescope Git integration
nnoremap <leader>gc  <cmd>Telescope git_commits<cr>
nnoremap <leader>gb  <cmd>Telescope git_branches<cr>
nnoremap <leader>gi  <cmd>Telescope git_status<cr>
nnoremap <leader>gs  <cmd>Telescope git_stash<cr>

nnoremap <leader>tt <cmd>terminal<cr>

" ------------------------- Line Number Customization ------------------------
highlight LineNr            guifg=#585b70  " Dim gray for inactive line numbers
highlight CursorLineNr      guifg=#aaFFaa  " Lime green for the current line number
highlight SignColumn        guibg=NONE     " Keep gutter background transparent

" ------------------------ Git & Diff Customization --------------------------
highlight DiffAdd           guifg=#a6e3a1  " Git added lines (greenish)
highlight DiffDelete        guifg=#f38ba8  " Git deleted lines (pinkish)
highlight GitGutterAdd      guifg=#a6e3a1  " Git added lines (greenish)
highlight GitGutterChange   guifg=#89b4fa  " Git changed lines (blueish)
highlight GitGutterDelete   guifg=#f38ba8  " Git deleted lines (pinkish)
autocmd BufWritePost,TextChanged,TextChangedI * GitGutter
autocmd BufEnter * GitGutter

" ------------------ Optional: Customize Current Line Highlight --------------
highlight CursorLine        guibg=#000000  " Highlight current line with background color
