--b NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
require 'config.lazy-bootstrap'

-- [[ Configure plugins ]]
require 'config.lazy-plugins'

-- [[ Setting options ]]
require 'config.options'

-- [[ Basic Keymaps ]]
require 'config.keymaps'

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require 'config.treesitter-setup'

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require 'config.lsp-setup'

require 'config.autocommands'

require 'config.debug-setup'

require 'config.snippets'

-- load user functions
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath 'config' .. '/lua/user_functions', [[v:val =~ '\.lua$']])) do
  require('user_functions.' .. file:gsub('.lua$', ''))
end
