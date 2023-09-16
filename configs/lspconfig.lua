local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.solargraph.setup(
  {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 50,
    },
    settings = {
      solargraph = {
        formatting = false,
        useBundler = true,
        diagnostics = true,
      },
    },
  }
)

require("formatter").setup({
  logging = false,
  filetype = {
    ruby = { require("custom.configs.formatter_rubocop") }, -- Format with rubocop -A instead normal.
    javascript = { require("formatter.filetypes.javascript").prettier },
    typescript = { require("formatter.filetypes.typescript").prettier },
    javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
    typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
    lua = { require("formatter.filetypes.lua").stylua },
    python = { require("formatter.filetypes.python").black },
  },
})
lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
})

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
    }
  }
})

