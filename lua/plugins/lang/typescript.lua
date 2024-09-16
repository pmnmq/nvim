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
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "biome", "ts_ls" })
      return opts
    end,
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "javascript", "typescript", "css", "html", "tsx" })
      return opts
    end,
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
