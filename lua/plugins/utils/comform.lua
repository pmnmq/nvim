local M = {}

--- config comform formatter
---@param opts table config options
---@param filetype string filetype
---@param formatter string formatter name
function M.config_formatter(opts, filetype, formatter)
  if not vim.tbl_contains(opts.formatters_by_ft, filetype) then
    opts.formatters_by_ft[filetype] = {}
  end
  table.insert(opts.formatters_by_ft[filetype], formatter)
end

return M
