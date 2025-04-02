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
vim.keymap.set('n', '<leader>g', ':Neogit<CR>', { desc = 'Git' })
vim.keymap.set('n', '<leader>q', ':qa<CR>', { desc = '[Q]uit all windows' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>qw', function()
  vim.cmd 'wa'
  vim.cmd 'qa'
end, { desc = 'Save all and quit' })

local builtin = require 'telescope.builtin'
local brain_dir = vim.fn.expand '~/Dropbox/2nd-brain'

vim.keymap.set('n', '<leader>bs', function()
  builtin.find_files {
    cwd = brain_dir,
  }
end, { desc = '[B]rain: [S]earch files' })

vim.keymap.set('n', '<leader>bn', function()
  local template_path = brain_dir .. '/templates/note-template.md'
  vim.ui.input({ prompt = 'New Brain Note: ' }, function(input)
    if input and #input > 0 then
      local full_path = brain_dir .. '/' .. input

      vim.fn.mkdir(vim.fn.fnamemodify(full_path, ':h'), 'p')

      -- Read and process template
      local template = vim.fn.readfile(template_path)
      local date_str = os.date '%d/%m/%Y'

      -- Replace {{date}} in each line
      for i, line in ipairs(template) do
        template[i] = line:gsub('{{date}}', date_str)
      end

      -- Write processed template
      vim.fn.writefile(template, full_path)

      vim.cmd('edit ' .. vim.fn.fnameescape(full_path))
    end
  end)
end, { desc = '[B]rain: [N]ew note' })
