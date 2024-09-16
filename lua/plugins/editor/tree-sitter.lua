return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    { "nvim-treesitter/nvim-treesitter-refactor" },
    { "nvim-treesitter/playground" },
    { "RRethy/nvim-treesitter-textsubjects" },
    { "RRethy/nvim-treesitter-endwise" },
    { "windwp/nvim-ts-autotag", config = true },
  },
  opts = {
    ensure_installed = { "http", "dot", "csv", "asm" },

    ignore_install = { "ruby", "julia", "php", "cuda", "tlaplus", "perl" },
    playground = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
    },
    indent = { enable = true, disable = { "ruby" } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = "<BS>",
        node_decremental = "<TAB>",
      },
    },
  },
  main = "nvim-treesitter.configs",
}
