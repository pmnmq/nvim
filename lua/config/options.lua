vim.g.mapleader = " "
vim.g.maplocalleader = " "
local options = {
  backup = false, -- 创建备份文件
  clipboard = "unnamedplus", -- 允许使用系统剪切板
  cmdheight = 1,
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, --
  fileencoding = "utf-8", -- 文件编码
  hlsearch = true, -- 搜索结果高亮
  ignorecase = true, -- 搜索匹配不区分大小写
  smartcase = true, -- smart case
  mouse = "a", -- 启用鼠标
  pumheight = 10, -- pop up menu height
  showmode = true, -- 显示当前操作模式
  showtabline = 2, -- 显示底部状态栏
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false,
  expandtab = false, -- convert tabs to spaces
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  tabstop = 4, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  cursorcolumn = false, -- cursor column.
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- 行号和文本之间空格
  exrc = true,
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- keep 8 height offset from above and bottom
  sidescrolloff = 8, -- keep 8 width offset from left and right
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  foldmethod = "expr", -- fold with nvim_treesitter
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false, -- no fold to be applied when open a file
  foldlevel = 99, -- if not set this, fold will be everywhere
  spell = false, -- 拼写检查
  spelllang = { "en_us" }, -- support which languages?
  diffopt = "vertical,filler,internal,context:4", -- vertical diff split view
  background = "dark",
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end
