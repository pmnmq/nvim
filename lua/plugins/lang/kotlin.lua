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
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "kotlin-language-server", "ktfmt", "ktlint" })
      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "kotlin", "java", "groovy" })
      return opts
    end,
  },
}
