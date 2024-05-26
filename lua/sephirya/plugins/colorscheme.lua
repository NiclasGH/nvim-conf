return {
  -- "bluz71/vim-nightfly-colors",
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.cmd [[colorscheme nightfly]]
    vim.cmd [[colorscheme tokyonight-night]]
  end,
}
