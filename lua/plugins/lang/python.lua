vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

local config_formatter = require("plugins.utils.comform").config_formatter
return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     opts.servers.basedpyright = {}
  --     opts.servers.pyright = {}
  --     return opts
  --   end,
  -- },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { vim.g.lazyvim_python_ruff, vim.g.lazyvim_python_lsp },
    },
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python", "requirements" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" },
      },
    },
  },
}
