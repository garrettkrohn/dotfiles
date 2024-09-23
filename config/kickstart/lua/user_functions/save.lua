-- switch function to not format for java code
local M = {}

local function saveFile()
  local filetype = vim.bo.filetype
  if filetype == 'java' then
    vim.cmd ':noa w'
  else
    vim.cmd ':w'
  end
end

vim.keymap.set('n', '<leader>ss', saveFile)

local function saveAll()
  local filetype = vim.bo.filetype
  if filetype == 'java' then
    vim.cmd ':noa wa'
  else
    vim.cmd ':wa'
  end
end

vim.keymap.set('n', '<leader>sa', saveAll)

return M
