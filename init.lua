
-- load all configs from config folder present in this directory
-- remember for windows your directory corresponds to directory 
-- user/AppData/Local/nvim/ .	-- WINDOWS
-- ~/.config/nvim/ .		-- LINUX

-- Some extra steps for windows
-- winget install BurntSushi.ripgrep.MSVC
-- winget install sharkdp.fd
-- winget install Git.Git

require("config.options")	-- file for changing vim default options
require("config.lazy")		-- file for setting up package manager
vim.cmd.colorscheme("material-darker") -- or whatever you chose
require("config.theme")     -- file for custom theme for nvim.