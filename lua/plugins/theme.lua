return {
  {
    "Shatur/neovim-ayu",
    lazy = true,
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "ayu-mirage",
  --   },
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
    config = function()
      local trans = require("transparent")
      trans.setup()
      -- trans.clear_prefix('BufferLine')
      trans.clear_prefix("Neotree")
    end,
  },
}
