return {
  "Civitasv/cmake-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    cmake_build_directory = "build/${variant:buildType}", 
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_soft_link_compile_commands = true, -- Create a link to compile_commands.json (needed for LSP)
    compile_commands_directory = "./",       -- But keep the link in root so clangd finds it
  },
  keys = {
    -- F5: Build
    { "<leader>bb", "<cmd>CMakeBuild<CR>", desc = "Build Project" },
    { "<leader>bt", "<cmd>CMakeSelectBuildType<CR>", desc = "Select Build Type" },
    { "<leader>bc", "<cmd>CMakeSelectConfigurePreset<CR>", desc = "Select CMake Preset" },
    { "<leader>bi", "<cmd>CMakeInstall<CR>", desc = "Install Target" },

  },
}
