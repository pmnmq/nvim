return {
  {
    import = "lazyvim.plugins.extras.lang.omnisharp",
    cond = function()
      return vim.fn.executable("dotnet") == 1
    end,
  },
}
