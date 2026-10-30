return {
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty
    keys = {
      {
        "<leader>L",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
        end,
        desc = "Toggle Inlay Hints",
      },
      {
        "<leader><leader>L",
        function()
          require("lsp-endhints").toggle()
        end,
        desc = "Toggle end of line Inlay Hints",
      },
    },
  }
}
