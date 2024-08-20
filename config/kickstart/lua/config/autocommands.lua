vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { 'aerospace.toml' },
  command = '!aerospace reload-config',
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '*tmux.conf' },
  command = "execute 'silent !tmux source <afile> --silent'",
})
