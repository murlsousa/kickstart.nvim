vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'keymaps.lua',
  command = "lua package.loaded['config.keymaps'] = nil require('config.keymaps')",
})
