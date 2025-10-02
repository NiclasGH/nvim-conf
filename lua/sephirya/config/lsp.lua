vim.lsp.enable({
  "lua_ls"
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end
      vim.keymap.set('n', keys, func, { buffer = ev.buf, noremap = true, silent = true, desc = desc })
    end

    -- Keymap for renaming all occurrences of a variable
    nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')

    -- Other useful LSP keymaps
    nmap('<leader>lc', vim.lsp.buf.code_action, 'Code Action')
    nmap('gd', vim.lsp.buf.definition, 'Go to Definition')
    nmap('gR', require('telescope.builtin').lsp_references, 'Go to References')
    nmap('gI', vim.lsp.buf.implementation, 'Go to Implementation')
    nmap('<leader>ld', vim.lsp.buf.hover, 'Hover Documentation')

    -- Keymaps for diagnostics
    nmap('<leader>lp', vim.diagnostic.goto_prev, 'Go to Previous Diagnostic')
    nmap('<leader>ln', vim.diagnostic.goto_next, 'Go to Next Diagnostic')
    nmap('<leader>ll', vim.diagnostic.open_float, 'Show Line Diagnostics')
  end,
})

-- Diagnostics
vim.diagnostic.config({       -- https://neovim.io/doc/user/diagnostic.html
  virtual_text = false,
  signs = true,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
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
