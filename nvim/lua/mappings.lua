require "nvchad.mappings"

local map = vim.keymap.set
local opt = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- 设置terminal 下快捷键
map("t", "<esc>", "<C-\\><C-n><C-w><C-w>", { noremap = true, silent = true })
map("n", "<leader>t", ":vsp | terminal<CR>", opt)
map("n", "<leader>bt", ":sp | terminal<CR>", opt)

-- 设置窗口大小调整
map("n", "<leader>wh", ":vertical resize -2<CR>", opt)
map("n", "<leader>wl", ":vertical resize +2<CR>", opt)
map("n", "<leader>wk", ":resize +2<CR>", opt)
map("n", "<leader>wj", ":resize -2<CR>", opt)

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>nf", ":NvimTreeFindFile<CR>", opt)
map("n", "<leader>nr", ":NvimTreeRefresh<CR>", opt)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Telescope
-- local builtin = require("telescope.builtin")
-- map("n", "<leader>ff", builtin.find_files, opt)
-- map("n", "<leader>fg", builtin.live_grep, opt)
-- map("n", "<leader>fb", builtin.buffers, opt)
-- map("n", "<leader>fh", builtin.help_tags, opt)
--
-- FZF
local fzfBuiltin = require "fzf-lua"
map("n", "<leader>ff", fzfBuiltin.files, { desc = "Fzf files" })
map("n", "<leader>fw", fzfBuiltin.live_grep, { desc = "Fzf Grep" })
map("n", "<leader>fb", fzfBuiltin.buffers, { desc = "Fzf Buffers" })
map("n", "<leader>fh", fzfBuiltin.helptags, { desc = "Help Tags" })
map("n", "<leader>gc", fzfBuiltin.git_bcommits, { desc = "Browse File Commits" })
map("n", "<leader>gt", fzfBuiltin.git_status, { desc = "Git Status" })
map("n", "<leader>r", fzfBuiltin.registers, { desc = "Registers" })
map("n", "<leader>m", fzfBuiltin.marks, { desc = "Marks" })
map(
  "n",
  "<leader>s",
  ":lua require'fzf-lua'.spell_suggest({ winopts = {relative='cursor',row=1.01, col=0, height=0.2, width=0.2} })<cr>",
  { desc = "Spelling Suggestions" }
)
map("n", "<leader>ca", fzfBuiltin.lsp_code_actions, { desc = "Code Actions" })
--

-- LSP
map("n", "gr", ":lua vim.lsp.buf.references()<CR>", opt)
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opt)
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opt)
-- map("n", "g[", ":lua vim.lsp.diagnostic.")

-- 代码折叠
map("n", "<leader>z", "$zf%", opt)
