local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.editor.dial" },
    { import = "lazyvim.plugins.extras.editor.mini-move" },
    { import = "lazyvim.plugins.extras.editor.inc-rename" },
    { import = "lazyvim.plugins.extras.editor.illuminate" },
    { import = "lazyvim.plugins.extras.editor.outline" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.ui.treesitter-context" },
    { import = "lazyvim.plugins.extras.util.rest" },
    { import = "lazyvim.plugins.extras.coding.mini-comment" },
    -- gen function document
    { import = "lazyvim.plugins.extras.coding.neogen" },
    { import = "plugins.disabled" },
    { import = "plugins.coding.cmp" },
    { import = "plugins.editor.colorizer" },
    { import = "plugins.editor.executor" },
    { import = "plugins.editor.fast-jk" },
    { import = "plugins.editor.flash" },
    { import = "plugins.editor.fold" },
    { import = "plugins.editor.multicursors" },
    { import = "plugins.editor.neotree" },
    { import = "plugins.editor.rainbow-bracket" },
    { import = "plugins.editor.session" },
    { import = "plugins.editor.surround" },
    { import = "plugins.editor.telescope" },
    { import = "plugins.editor.term" },
    { import = "plugins.editor.tree-sitter" },
    { import = "plugins.git.lazygit" },
    { import = "plugins.lsp" },
    { import = "plugins.theme.theme" },
    { import = "plugins.theme.transparent" },
    { import = "plugins.ui.barbecue" },
    { import = "plugins.ui.codewindow" },
    { import = "plugins.ui.dashboard" },
    { import = "plugins.ui.incline" },
    { import = "plugins.ui.lsp-lens" },
    { import = "plugins.ui.lualine" },
    { import = "plugins.lang" },
    -- { import = "lazyvim.plugins.extras.coding.luasnip" }, -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    -- { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
