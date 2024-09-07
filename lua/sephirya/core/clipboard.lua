-- Global function to compare the current selection with clipboard content
function CompareToClipboard()
  -- Get the current filetype
  local ftype = vim.api.nvim_eval("&filetype")

  local original_win = vim.api.nvim_get_current_win()
  vim.fn.setreg('a', original_win)

  -- Copied: ", Selection "x
  local copied = vim.fn.getreg('"')
  vim.fn.setreg('x', copied)
  vim.cmd('normal! gvy')

  -- Open a new split and paste the clipboard content into the new buffer (Right Window)
  vim.cmd('vsplit')
  vim.cmd('enew')                        -- Create a new empty buffer
  vim.cmd('setlocal buftype=nowrite')    -- Set the new buffer to be read-only
  vim.cmd('set filetype=' .. ftype)      -- Set the filetype to the original one
  vim.cmd('normal! "xP')                   -- Paste the clipboard content into the buffer
  vim.cmd('diffthis')                    -- Start diff mode in this read-only buffer

  -- Switch back to the original window, create new buffer and paste content
  vim.cmd('wincmd p')
  vim.cmd('enew')
  vim.cmd('normal! P')
  vim.cmd('diffthis')
end

function AcceptChanges()
  if vim.fn.getreg('x') == '' then
    do return end
  end

  vim.cmd('normal! gg') -- Top of page
  vim.cmd('normal! yG') -- Copy into unnamed register
  vim.cmd('bd!')
  vim.cmd('bd!')

  if vim.fn.getreg('a') ~= vim.api.nvim_get_current_win() then
    vim.cmd('bd!')
  end

  -- Paste the changes into original selection
  vim.cmd('normal! gvp')               -- 'gv' re-selects the last visual selection, 'p' pastes the content
  vim.fn.setreg('x', '')
  vim.fn.setreg('a', '')
end

-- Bind the CompareToClipboard function to <Space>cc
vim.api.nvim_set_keymap('v', '<leader>cc', ':lua CompareToClipboard()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', ':lua AcceptChanges()<CR>', { noremap = true, silent = true })
