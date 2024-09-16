local config_formatter = require("plugins.utils.comform").config_formatter

return {
  { import = "lazyvim.plugins.extras.lang.clangd" },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "clangd", "clang-format" })
      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "cpp")
      return opts
    end,
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
