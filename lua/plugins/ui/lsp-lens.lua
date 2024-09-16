return {
  "VidocqH/lsp-lens.nvim",
  keys = {
    { "<leader>ue", "<cmd>LspLensToggle<cr>", desc = "Toggle Lsp Lens" },
  },
  event = "VeryLazy",
  opts = {
    enable = true,
    include_declaration = false, -- Reference include declaration
    sections = { -- Enable / Disable specific request, formatter example looks 'Format Requests'
      definition = true,
      references = true,
      implements = true,
      git_authors = true,
    },
    ignore_filetype = {
      "prisma",
    },
  },
}
