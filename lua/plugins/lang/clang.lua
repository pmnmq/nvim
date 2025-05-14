local config_formatter = require("plugins.utils.comform").config_formatter

return {
  { import = "lazyvim.plugins.extras.lang.clangd" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "clangd", "clang-format" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "cpp" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      config_formatter(opts, "c", "clang-format")
      config_formatter(opts, "cpp", "clang-format")
      return opts
    end,
  },
}
