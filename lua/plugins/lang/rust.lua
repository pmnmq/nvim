local config_formatter = require("plugins.utils.comform").config_formatter

return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     opts.servers.rust_analyzer = {}
  --     return opts
  --   end,
  -- },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "rust-analyzer", "codelldb", "rustfmt" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "rust", "ron" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      config_formatter(opts, "rust", "rustfmt")
      return opts
    end,
  },
}
