local config_formatter = require("plugins.utils.comform").config_formatter

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.protols = {}
      return opts
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "protols" },
    },
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "proto" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        proto = { "clang-format" },
      },
    },
  },
}
