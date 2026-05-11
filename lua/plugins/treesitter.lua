return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdate", "TSInstall" },
  config = function()
    -- Attempt to load the old 'configs' module
    local status, treesitter_configs = pcall(require, "nvim-treesitter.configs")
    
    local settings = {
      -- Your existing preferences
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true, 
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true }, 
    }

    if status then
      -- Compatibility mode: Use the old setup if the module exists (WSL)
      treesitter_configs.setup(settings)
    else
      -- Modern mode: Use the direct setup for nvim-treesitter v1.0+ (Windows)
      require("nvim-treesitter").setup(settings)
    end
  end
}