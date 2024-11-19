local opts = {
      "borderless",
      global_file_icons = true,
      global_git_icons = false,
      -- files = {
      --   path_shorten = 1,
      -- },
      -- grep = {
      --   path_shorten = 1,
      -- },
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
      hls = {
        normal = "TelescopeNormal",
        border = "TelescopeBorder",
        title = "TelescopePromptTitle",
        help_normal = "TelescopeNormal",
        help_border = "TelescopeBorder",
        preview_normal = "TelescopeNormal",
        preview_border = "TelescopeBorder",
        cursor = "Cursor",
        cursorline = "TelescopePreviewLine",
        cursorlinenr = "TelescopePreviewLine",
        search = "IncSearch",
        preview_title = "TelescopePreviewTitle",
      },
      fzf_colors = {
        ["fg"] = { "fg", "TelescopeNormal" },
        ["bg"] = { "bg", "TelescopeNormal" },
        ["hl"] = { "fg", "TelescopeMatching" },
        ["fg+"] = { "fg", "TelescopeSelection" },
        ["bg+"] = { "bg", "TelescopeSelection" },
        ["hl+"] = { "fg", "TelescopeMatching" },
        ["info"] = { "fg", "TelescopeMultiSelection" },
        ["border"] = { "fg", "TelescopeBorder" },
        ["gutter"] = { "bg", "TelescopeNormal" },
        ["prompt"] = { "fg", "TelescopePromptPrefix" },
        ["pointer"] = { "fg", "TelescopeSelectionCaret" },
        ["marker"] = { "fg", "TelescopeSelectionCaret" },
        ["header"] = { "fg", "TelescopePromptTitle" },
      },
    }

require("fzf-lua").setup(opts)
