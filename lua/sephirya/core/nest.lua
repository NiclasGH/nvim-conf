-- nest mapping. Comment import in init.lua if you're on a qwerty system
local function apply_nest_for(mode)
  local opts = { noremap = true, silent = true }

  vim.api.nvim_set_keymap(mode, 'n', 'j', opts)
  vim.api.nvim_set_keymap(mode, 'e', 'k', opts)
  vim.api.nvim_set_keymap(mode, 's', 'h', opts)
  vim.api.nvim_set_keymap(mode, 't', 'l', opts)
  vim.api.nvim_set_keymap(mode, 'N', 'J', opts)
  vim.api.nvim_set_keymap(mode, 'E', 'K', opts)
  vim.api.nvim_set_keymap(mode, 'S', 'H', opts)
  vim.api.nvim_set_keymap(mode, 'T', 'L', opts)

  vim.api.nvim_set_keymap(mode, 'j', 'n', opts)
  vim.api.nvim_set_keymap(mode, 'k', 'e', opts)
  vim.api.nvim_set_keymap(mode, 'h', 's', opts)
  vim.api.nvim_set_keymap(mode, 'l', 't', opts)
  vim.api.nvim_set_keymap(mode, 'J', 'N', opts)
  vim.api.nvim_set_keymap(mode, 'K', 'E', opts)
  vim.api.nvim_set_keymap(mode, 'H', 'S', opts)
  vim.api.nvim_set_keymap(mode, 'L', 'T', opts)
end

apply_nest_for('n')
apply_nest_for('v')
apply_nest_for('o')

