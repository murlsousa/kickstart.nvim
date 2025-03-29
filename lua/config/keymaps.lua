vim.keymap.set('n', '<leader>o', ':ClangdSwitchSourceHeader<CR>', { desc = 'Switch between source and header' })
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move line(s) down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move line(s) up' })
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })

vim.keymap.set('n', '<leader>rr', function()
  local current_word = vim.fn.expand '<cword>' -- Get word under cursor
  local new_word = vim.fn.input("Replace '" .. current_word .. "' with: ") -- Ask for new word

  if new_word ~= '' then
    vim.cmd(':%s/\\<' .. current_word .. '\\>/' .. new_word .. '/g')
  end
end, { desc = 'Replace word under cursor' })

vim.keymap.set('n', '<leader>q', ':qa<CR>', { desc = 'Quit all windows' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>qw', function()
  vim.cmd 'wa'
  vim.cmd 'qa'
end, { desc = 'Save all and quit' })
