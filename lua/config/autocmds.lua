vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua", "javascriptreact", "javascript", "typescript", "json", "typescriptreact" },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
  end,
})
