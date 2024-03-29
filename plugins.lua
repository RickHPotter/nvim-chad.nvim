local cmp = require("cmp")

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "rust-analyzer",
        "html-lsp",
        "htmlbeautifier",
        "eslint-lsp",
        "json-to-struct",
        "ruby-lsp",
        "erb-lint",
        "emmet-ls",
        "typescript-language-server",
        "solargraph",
     },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, _)
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = 'BufEnter',
  },
  -- TODO: formatter is not working
  {
    "mhartington/formatter.nvim",
    config = function()
      require "custom.configs.formatter"
    end
  },
  {
 "folke/persistence.nvim",
    event = "BufReadPre",
    config = function ()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = {'buffers', 'curdir', 'tabpages', 'winsize'},
        pre_save = function()
          vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
        end,
      })
    end
  },
  "rcarriga/nvim-notify",
  --
  -- RUBY ON RAILS
  --
  -- if the following lines work, I'm a headless whitch with triple breasts
  { "otavioschwanck/ruby-toolkit.nvim" },
  { "vim-ruby/vim-ruby" },
  { "tpope/vim-dispatch" },
  { "tpope/vim-rake" },
  { "tpope/vim-rails" },
  { "tpope/vim-bundler" },
  --
  -- DART FLUTTER
  --
  {
    "akinsho/flutter-tools.nvim",
    event = "VeryLazy",
    dependencies = {
      'nvim-lua/plenary.nvim',
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({})
    end,
  },
  --
  -- GO DEPENDECIES
  --
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  --
  -- RUST DEPENDENCIES
  --
  {
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },
    'saecki/crates.nvim',
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
}

return plugins
