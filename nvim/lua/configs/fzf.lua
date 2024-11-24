local opts = {
  "fzf-native",
  global_file_icons = true,
  global_git_icons = false,
  files = {
    -- path_shorten = 1,
    resume = true,
  },
  grep = {
    -- debug = true,
    resume = true,
    -- path_shorten = 3,
  },
  winopts = {
    height = 0.8,
    width = 0.9,
    row = 0.5,
    preview = {
      horizontal = "right:55%",
      -- winopts = {
      --   number = false,
      -- },
    },
    on_create = function()
      vim.keymap.set("t", "<C-r>", [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true, buffer = true })
    end,
  },
}
require("fzf-lua").setup(opts)
