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
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "bash-language-server", "shfmt" })
      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "bash", "fish" })
      return opts
    end,
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
