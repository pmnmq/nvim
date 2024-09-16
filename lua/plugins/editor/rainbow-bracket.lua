return {
  "hiphish/rainbow-delimiters.nvim",
  event = "BufEnter",
  config = function()
    require("rainbow-delimiters.setup").setup({
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    })
  end,
}
