-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "gopls", "pylsp", "rust_analyzer", "lua_ls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "Lua 5.4",
        path = {
          "?.lua",
          "?/init.lua",
          vim.fn.expand "~/.luarocks/share/lua/5.4/?.lua",
          vim.fn.expand "~/.luarocks/share/lua/5.4/?/init.lua",
          "/usr/local/share/5.4/?.lua",
          "/usr/local/share/lua/5.4/?/init.lua",
        },
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "~/.luarocks/share/lua/5.4",
          "/usr/local/share/lua/5.4",
        },
      },
    },
  },
}
