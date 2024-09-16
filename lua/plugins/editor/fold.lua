return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  lazy = false,
  config = function()
    require("ufo").setup()
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.keymap.set("n", "zR", function()
      require("ufo").openAllFolds()
    end)
    vim.keymap.set("n", "zM", function()
      require("ufo").closeAllFolds()
    end)
  end,
}
