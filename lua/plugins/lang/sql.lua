return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.postgres_lsp = {
        cmd = { "postgres-language-server", "lsp-proxy" },
        filetypes = {
          "sql",
        },
        root_markers = { "postgres-language-server.jsonc" },
      }
      return opts
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "sqlfluff", "postgres-language-server" },
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
