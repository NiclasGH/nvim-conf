return {
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
      local lsp_zero = require "lsp-zero"

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps { buffer = bufnr }
      end)

      require("mason").setup {}
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer" },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup {}
          end,
        },
      }
    end,
  },
}
