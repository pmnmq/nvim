local config_formatter = require("plugins.utils.comform").config_formatter

return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      local is_nixos = vim.fn.getenv("ZSHRC_FLAG_IS_NIXOS")
      if is_nixos == "true" then
        table.insert(opts.ensure_installed, "nix")
      end
      table.insert(opts.ensure_installed, "nixfmt")
      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "nix" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      config_formatter(opts, "nix", "nixfmt")
      return opts
    end,
  },
}
