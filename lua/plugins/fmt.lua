return {
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          sh = { "shfmt" },
          python = { "ruff_fix", "ruff_format" },
          go = { "gofumpt", "goimports" },
          c = { "clang-format" },
          json = { "biome" },
          zsh = { "shfmt" },
          javascript = { "biome" },
          rust = { "rustfmt" },
          csharp = { "csharpier" },
          c_sharp = { "csharpier" },
          cs = { "csharpier" },
          toml = { "taplo" },
        },
        formatters = {
          injected = { options = { ignore_errors = true } },
        },
      }
      return opts
    end,
  },
}
