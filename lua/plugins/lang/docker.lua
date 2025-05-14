return {

  { import = "lazyvim.plugins.extras.lang.docker" },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "docker-compose-language-service" },
    },
  },
}
