return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      scroll = { enabled = false },
      picker = {
        sources = {
          explorer = {
            auto_close = false,
            layout = {
              layout = {
                backdrop = false,
                width = 35,
                min_width = 20,
                height = 0,
                position = "left",
                border = "none",
                box = "vertical",
                {
                  win = "input",
                  height = 1,
                  border = "rounded",
                  title = "{title} {live} {flags}",
                  title_pos = "center",
                },
                { win = "list", border = "none" },
                { win = "preview", title = "{preview}", height = 0.4, border = "top" },
              },
            },
          },
        },
      },
    },
  },
}
