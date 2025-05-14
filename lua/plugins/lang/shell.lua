local config_formatter = require("plugins.utils.comform").config_formatter

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          filetypes = { "sh", "zsh", "bash" },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "bash-language-server", "shfmt" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "bash", "fish" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      config_formatter(opts, "bash", "shfmt")
      config_formatter(opts, "zsh", "shfmt")
      return opts
    end,
  },
}
