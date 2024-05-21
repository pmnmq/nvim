local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch("([^/]+)") do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = require("lazyvim.config").icons

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },

          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { LazyVim.lualine.pretty_path() },
          },
          lualine_x = {
            {
              function()
                local msg = "No Active Lsp"
                local clients = vim.lsp.get_active_clients({ id = 1 })
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    msg = client.name
                  end
                end
                if next(vim.lsp.get_active_clients()) ~= nil then
                  msg = "  LSP:" .. msg
                end
                return msg
              end,
            },
            {
              function()
                local venv = get_venv("VIRTUAL_ENV_PROMPT")
                return " " .. venv
              end,
              cond = function()
                return vim.bo.filetype == "python"
              end,
            },
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = LazyVim.ui.fg("Statement"),
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = LazyVim.ui.fg("Constant"),
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = LazyVim.ui.fg("Debug"),
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = LazyVim.ui.fg("Special"),
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    opts = {
      -- width = 40,
      auto_close = true,
      keymaps = {
        close = { "q" },
      },
    },
    event = "VeryLazy",
    config = function(_, opts)
      vim.keymap.set("n", "<leader>so", "<cmd>:SymbolsOutline<CR>")
      require("symbols-outline").setup(opts)
    end,
  },
  {
    "gorbit99/codewindow.nvim",
    lazy = "VeryLazy",
    event = "BufEnter",
    config = function()
      local codewindow = require("codewindow")
      codewindow.setup({
        minimap_width = 12,
      })
      codewindow.apply_default_keybinds()
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    opts = function()
      local version = "v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
      local home = os.getenv("HOME")
      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          -- header = vim.split(logo, "\n"),
					-- stylua: ignore
					center = {
						{ action = LazyVim.telescope("files"),                                 desc = " Find File",       icon = " ", key = "f" },
						{ action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
						{ action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "r" },
						{ action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
						{ action = [[lua LazyVim.telescope.config_files()()]],                 desc = " Config",          icon = " ", key = "c" },
						{ action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
						{ action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
						{ action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
						{ action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
					},
					-- stylua: ignore
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim " .. version .. " loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
        preview = {
          command = "cat",
          file_path = home .. "/.config/nvim/neovim.cat",
          file_height = 11,
          file_width = 70,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end
      return opts
    end,
  },
}
