return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  -- lsp
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",

      -- Autocompletion
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",

      -- Snippets
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local lsp_zero = require "lsp-zero" -- Use :h lsp-zero for shortcuts

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps { buffer = bufnr }
        vim.keymap.set('n', '<A-Enter>', function() vim.lsp.buf.code_action() end) -- win/linux
        vim.keymap.set('n', '<M-Enter>', function() vim.lsp.buf.code_action() end) -- macOs
      end)

      vim.diagnostic.config({  -- https://neovim.io/doc/user/diagnostic.html
        virtual_text = false,
        signs = true,
        underline = true,
      })
      -- Diagnostics on hover
      vim.api.nvim_create_autocmd({ "CursorHold" }, {
        pattern = "*",
        callback = function()
          for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.api.nvim_win_get_config(winid).zindex then
              return
            end
          end
          vim.diagnostic.open_float({
            scope = "cursor",
            focusable = false,
            close_events = {
              "CursorMoved",
              "CursorMovedI",
              "BufHidden",
              "InsertCharPre",
              "WinLeave",
            },
          })
        end
      })

      require("mason").setup {}
      require("mason-lspconfig").setup {
        PATH = "append",
        ensure_installed = { "lua_ls" },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup {}
          end,
        },
      }
    end,
  },
}
