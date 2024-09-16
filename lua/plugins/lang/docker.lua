return {
  { import = "lazyvim.plugins.extras.lang.docker" },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.tbl_extend("keep", opts.ensure_installed, { "docker-compose-language-service" })
      return opts
    end,
  },
}
