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
    opts = function(_, opts)
      config_formatter(opts, "toml", "taplo")
      return opts
    end,
  },
}
