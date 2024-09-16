return {
  "xiyaowong/transparent.nvim",
  event = "VeryLazy",
  config = function()
    local trans = require("transparent")
    trans.setup()
    -- trans.clear_prefix('BufferLine')
    trans.clear_prefix("Neotree")
  end,
}
