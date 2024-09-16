local opts_n = { noremap = true, silent = false }
local opts = { noremap = false, silent = false }
local opts_n_s = { noremap = true, silent = true }
local opts_s = { noremap = false, silent = true }

local keymaps = {
  -- 窗口移动
  {
    mode = "n",
    origin = "<C-w>h",
    target = "<C-h>",
    option = opts_n_s,
  },
  {
    mode = "n",
    origin = "<C-w>j",
    target = "<C-j>",
    option = opts_n_s,
  },
  {
    mode = "n",
    origin = "<C-w>k",
    target = "<C-k>",
    option = opts_n_s,
  },
  {
    mode = "n",
    origin = "<C-w>l",
    target = "<C-l>",
    option = opts_n_s,
  },
  -- 快速移动
  -- {
  --   mode = "",
  --   origin = "5j",
  --   target = "<A-j>",
  --   option = opts_n_s,
  -- },
  -- {
  --   mode = "",
  --   origin = "5k",
  --   target = "<A-k>",
  --   option = opts_n_s,
  -- },
  {
    mode = "",
    origin = "$",
    target = "L",
    option = opts_n,
  },
  {
    mode = "",
    origin = "0",
    target = "H",
    option = opts_n,
  },
  -- 取消搜索高亮
  {
    mode = "n",
    origin = ":nohlsearch<CR>",
    target = "<Leader><CR>",
    option = opts_n_s,
  },
  --文件保存
  {
    mode = "n",
    origin = ":w<CR>",
    target = "S",
    option = opts_n_s,
  },
  -- 退出
  {
    mode = "",
    origin = ":q<CR>",
    target = "Q",
    option = opts_n_s,
  },
  -- 复制到系统剪切板
  {
    mode = "v",
    origin = '"+y',
    target = "Y",
    option = opts_n,
  },
}

for _, keymap_info in pairs(keymaps) do
  vim.keymap.set(keymap_info["mode"], keymap_info["target"], keymap_info["origin"], keymap_info["option"])
end
