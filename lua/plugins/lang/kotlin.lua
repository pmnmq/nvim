return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.kotlin_language_server = {
        settings = {
          kotlin = {
            compiler = {
              jvm = {
                target = "17",
              },
            },
          },
        },
      }
      return opts
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "kotlin-language-server", "ktfmt", "ktlint" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "kotlin", "java", "groovy" },
    },
  },
}
