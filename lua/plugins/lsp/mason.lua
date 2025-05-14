return {
  {
    "mason-org/mason.nvim",
    -- dependencies = {
    --   {
    --     "zapling/mason-lock.nvim",
    --     cmd = { "MasonLock", "MasonLockRestore" },
    --   },
    -- },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_installation = true,
      -- ensure_installed = {},
      automatic_enable = true,
    },
  },
}
