local config_path = vim.fn.stdpath("config")

return {
  "williamboman/mason.nvim",
  dependencies = {
    "zapling/mason-lock.nvim",
    cmd = { "MasonLock", "MasonLockRestore" },
    opts = {},
  },
  opts = {
    registries = {
      "github:mason-org/mason-registry",
      "file:" .. config_path .. "/mason-registry",
    },
  },
}
