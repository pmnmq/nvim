vim.g.lazyvim_python_lsp = "basedpyright"
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
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { vim.g.lazyvim_python_lsp, vim.g.lazyvim_python_ruff })
      return opts
    end,
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "python", "requirements" })
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      config_formatter(opts, "python", "ruff_format")
      config_formatter(opts, "python", "ruff_fix")
      return opts
    end,
  },
}
