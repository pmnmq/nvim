return {
  "gorbit99/codewindow.nvim",
  event = "VeryLazy",
  config = function()
    local codewindow = require("codewindow")
    codewindow.setup({
      minimap_width = 12,
    })
    codewindow.apply_default_keybinds()
  end,
}
