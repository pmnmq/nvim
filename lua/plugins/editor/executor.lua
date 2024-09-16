return {
  {
    "google/executor.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "ExecutorRun",
      "ExecutorSetCommand",
      "ExecutorShowDetail",
      "ExecutorHideDetail",
      "ExecutorToggleDetail",
      "ExecutorSwapToSplit",
      "ExecutorSwapToPopup",
      "ExecutorShowPresets",
      "ExecutorShowHistory",
      "ExecutorReset",
    },
    config = function()
      require("executor").setup({})
    end,
  },
}
