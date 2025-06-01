local config_formatter = require("plugins.utils.comform").config_formatter

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.taplo = {
        root_dir = require("lspconfig.util").root_pattern("*.toml", ".git"),
      }
      return opts
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "taplo" },
    },
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "toml" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        toml = { command = "taplo", args = { "fmt", "$FILENAME" } },
      },
    },
  },
}
