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

-- [[ Configure Telescope ]]
-- (fuzzy finder)
require 'config.telescope-setup'

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require 'config.treesitter-setup'

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require 'config.lsp-setup'

require 'config.autocommands'
