return {
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty
    config = function()
      -- Toggle Inlay Hints
      if vim.lsp.inlay_hint then
        vim.keymap.set('n',
          '<leader>L',
          function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { buffnr }) end,
          { desc = "Toggle Inlay Hints" }
        )
      end
    end
  }, 
}
