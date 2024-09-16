local config_formatter = require("plugins.utils.comform").config_formatter

return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     opts.servers.rust_analyzer = {}
  --     return opts
  --   end,
  -- },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.tbl_extend("force", opts.ensure_installed, { "rust-analyzer", "codelldb" })
      if vim.fn.executable("rustfmt") ~= 1 then
        vim.tbl_extend("force", opts.ensure_installed, { "rustfmt" })
      end
      return opts
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        opts = {
          completion = {
            cmp = { enabled = true },
          },
        },
      },
    },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "crates" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "rust", "ron" })
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      config_formatter(opts, "rust", "rustfmt")
      return opts
    end,
  },
}
