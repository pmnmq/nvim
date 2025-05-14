local config_formatter = require("plugins.utils.comform").config_formatter

return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     opts.servers.ts_ls = {}
  --     return opts
  --   end,
  -- },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "biome", "typescript-language-server" },
    },
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "javascript", "typescript", "css", "html", "tsx" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      config_formatter(opts, "javascript", "biome")
      config_formatter(opts, "javascriptreact", "biome")
      config_formatter(opts, "typescript", "biome")
      config_formatter(opts, "typescriptreact", "biome")
      return opts
    end,
  },
}
