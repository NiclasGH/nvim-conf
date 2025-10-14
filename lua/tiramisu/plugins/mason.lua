return {
  { -- Dont install rust-analyzer through Mason. This has extra lsp features, that the generic lsp guideline doesnt include
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "autotools_ls", -- make
          "bashls",
          "docker_language_server"
        }
      })
    end
  }
}
