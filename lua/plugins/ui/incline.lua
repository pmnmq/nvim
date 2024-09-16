return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local devicons = require("nvim-web-devicons")
    require("incline").setup({
      window = {
        padding = 0,
        margin = { horizontal = 0 },
        winhighlight = {
          active = {
            EndOfBuffer = "None",
            Normal = "InclineNormal",
            Search = "None",
          },
          inactive = {
            EndOfBuffer = "None",
            Normal = "InclineNormalNC",
            Search = "None",
          },
        },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        if props.focused then
          return {
            ft_icon and { " ", ft_icon, " ", guibg = "#FF1493", guifg = ft_color } or "",
            { filename, gui = modified and "bold,italic" or "bold", guifg = "#000000" },
            " ",
            guibg = "#FF1493",
          }
        end
        return {
          ft_icon and { " ", ft_icon, " ", guifg = ft_color } or "",
          { filename, guifg = "#FF1493" },
          " ",
        }
      end,
    })
  end,
}
