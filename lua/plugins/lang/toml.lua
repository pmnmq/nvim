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
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if vim.fn.executable("taplo") ~= 1 then
        vim.tbl_extend("keep", opts.ensure_installed, { "taplo" })
      end
      return opts
    end,
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "toml")
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      config_formatter(opts, "toml", "taplo")
      return opts
    end,
  },
}
