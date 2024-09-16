return {
  { import = "lazyvim.plugins.extras.lang.go" },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if not vim.tbl_contains(opts.ensure_installed, "gopls") then
        table.insert(opts.ensure_installed, "gopls")
      end
      return opts
    end,
  },
}
