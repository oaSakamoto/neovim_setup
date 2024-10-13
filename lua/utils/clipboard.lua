local function wl_copy()
  local content = vim.fn.getreg('0')
  vim.fn.system('wl-copy', content)
end

vim.keymap.set('n', '<leader>y', wl_copy, { noremap =true, silent = true })
