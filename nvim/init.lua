vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
		config = function()
			require("options")
		end,
	},

	{ import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("nvchad.autocmds")

vim.schedule(function()
	require("mappings")
end)

-- 自动切换输入法
-- 记录当前输入法
Current_input_method = vim.fn.system("/usr/local/bin/macism")

-- 切换到英文输入法
function Switch_to_English_input_method()
	Current_input_method = vim.fn.system("/usr/local/bin/macism")
	if Current_input_method ~= "com.apple.keylayout.ABC\n" then
		vim.fn.system("/usr/local/bin/macism com.apple.keylayout.ABC")
	end
end

-- 设置输入法
function Set_input_method()
	if Current_input_method ~= "com.apple.keylayout.ABC\n" then
		vim.fn.system("/usr/local/bin/macism " .. string.gsub(Current_input_method, "\n", ""))
	end
end

-- 进入 normal 模式时切换为英文输入法
vim.cmd([[
augroup input_method
  autocmd!
  autocmd InsertEnter * :lua Set_input_method()
  autocmd InsertLeave * :lua Switch_to_English_input_method()
augroup END
]])

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.lua",
	callback = function()
		require("stylua-nvim").format()
	end,
	group = format_sync_grp,
})
