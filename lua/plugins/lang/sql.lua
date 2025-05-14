local config_formatter = require("plugins.utils.comform").config_formatter

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.postgres_lsp = {
        cmd = { "postgrestools", "lsp-proxy" },
        filetypes = {
          "sql",
        },
        root_markers = { "postgrestools.jsonc" },
      }
      return opts
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "sqlfluff", "postgrestools" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "sql" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      config_formatter(opts, "sql", "sqlfluff")
      return opts
    end,
  },
}
