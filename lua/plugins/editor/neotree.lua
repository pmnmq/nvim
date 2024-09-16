return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 30,
    },
    filesystem = {
      filtered_items = {
        hide_hidden = true,
        hide_by_name = {
          "node_modules",
        },
      },
      window = {
        mappings = {
          ["o"] = "open",
          ["oc"] = "",
          ["od"] = "",
          ["og"] = "",
          ["om"] = "",
          ["on"] = "",
          ["os"] = "",
          ["ot"] = "",
        },
      },
    },
  },
}
