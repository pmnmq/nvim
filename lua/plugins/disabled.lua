local disabled = {
  { "echasnovski/mini.surround" },
  { "nvimtools/none-ls.nvim" },
  { "mfussenegger/nvim-lint" },
  { "folke/edgy.nvim" },
  { "kristijanhusak/vim-dadbod-ui" },
  { "kristijanhusak/vim-dadbod-completion" },
  { "tpope/vim-dadbod" },
  -- { "echasnovski/mini.icons" },
}

for _, plugin in ipairs(disabled) do
  plugin.enabled = false
end
return disabled
