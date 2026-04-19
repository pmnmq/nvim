return {
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   config = function()
  --     require("nvim-surround").setup({
  --       -- Configuration here, or leave empty to use defaults
  --     })
  --   end,
  -- },
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "Sa", -- Add surrounding in Normal and Visual modes
        delete = "Sd", -- Delete surrounding
        find = "Sf", -- Find surrounding (to the right)
        find_left = "SF", -- Find surrounding (to the left)
        highlight = "Sh", -- Highlight surrounding
        replace = "Sr", -- Replace surrounding
        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    },
  },
}
