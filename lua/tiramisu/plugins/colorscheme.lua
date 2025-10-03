return {
  -- "bluz71/vim-nightfly-colors",
  -- "folke/tokyonight.nvim",
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.cmd [[colorscheme nightfly]]
    -- vim.cmd [[colorscheme tokyonight-night]]
    -- vim.cmd [[colorscheme tokyonight-night]]
    vim.cmd [[colorscheme vscode]]
  end,
}
