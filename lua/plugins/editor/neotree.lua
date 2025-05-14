return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false,
  opts = {
    sources = { "document_symbols" },
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
      group_empty_dirs = true,
      scan_mode = "deep",
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
