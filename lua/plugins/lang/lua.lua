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
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "lua_ls", "stylua" })
      return opts
    end,
  },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "lua")
      return opts
    end,
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
