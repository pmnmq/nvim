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
    opts = {
      formatters_by_ft = {
        sql = { "sqlfluff" },
      },
    },
  },
}
