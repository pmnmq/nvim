local config_formatter = require("plugins.utils.comform").config_formatter

return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     opts.servers.taplo = {}
  --     return opts
  --   end,
  -- },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "clang-format", "protols" })
      return opts
    end,
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "proto")
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      config_formatter(opts, "proto", "clang-format")
      return opts
    end,
  },
}
