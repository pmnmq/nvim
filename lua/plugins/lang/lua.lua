return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            doc = {
              privateName = { "^_" },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      }
      return opts
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "lua-language-server", "stylua" },
    },
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "lua" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.lua = opts.formatters_by_ft.lua or {}
      table.insert(opts.formatters_by_ft.lua, "stylua")
      return opts
    end,
  },
}
