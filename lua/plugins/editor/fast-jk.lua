return {
  {
    "rainbowhxch/accelerated-jk.nvim",
    keys = { "j", "k" },
    config = function()
      local fast = require("accelerated-jk")
      vim.keymap.set("n", "j", function()
        fast.move_to("j")
      end)
      vim.keymap.set("n", "k", function()
        fast.move_to("k")
      end)
    end,
  },
}
