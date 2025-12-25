return {
  "Civitasv/cmake-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    cmake_build_directory = "build/${variant:buildType}", 
  },
  keys = {
    -- F5: Build
    { "<F5>", "<cmd>CMakeBuild<CR>", desc = "Build Project" },
    { "<S-F5>", "<cmd>CMakeSelectBuildType<CR>", desc = "Select Build Type" },
    { "<C-F5>", "<cmd>CMakeSelectConfigurePreset<CR>", desc = "Select CMake Preset" },
    { "<F6>", "<cmd>CMakeInstall<CR>", desc = "Install Target" },

  },
}
