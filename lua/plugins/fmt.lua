return {
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          sh = { "beautysh" },
          python = { "ruff_fix", "ruff_format" },
          go = { "gofumpt", "goimports" },
          c = { "clang-format" },
          json = { "biome" },
          zsh = { "beautysh" },
          javascript = { "biome" },
          rust = { "rustfmt" },
        },
        formatters = {
          injected = { options = { ignore_errors = true } },
        },
      }
      return opts
    end,
  },
}
