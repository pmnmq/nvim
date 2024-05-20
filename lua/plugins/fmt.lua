return {
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          sh = { "beautysh" },
          py = { "ruff" },
          rs = { "rustfmt" },
          go = { "gofumpt" },
          c = { "clang-format" },
          json = { "biome" },
          zsh = { "beautysh" },
        },
        formatters = {
          injected = { options = { ignore_errors = true } },
        },
      }
      return opts
    end,
  },
}
