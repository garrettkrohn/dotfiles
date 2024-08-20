-- set leader key to space
vim.g.mapleader = ' '

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- clear search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>')

-- delete single character without copying into register
keymap.set('n', 'x', '"_x')

-- increment/decrement numbers
keymap.set('n', '<leader>+', '<C-a>') -- increment
keymap.set('n', '<leader>-', '<C-x>') -- decrement

-- window management
keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s') -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=') -- make split windows equal width & height
keymap.set('n', '<leader>sx', ':close<CR>') -- close current split window

keymap.set('n', '<leader>to', ':tabnew<CR>') -- open new tab
keymap.set('n', '<leader>tx', ':tabclose<CR>') -- close current tab
keymap.set('n', '<leader>tn', ':tabn<CR>') --  go to next tab
keymap.set('n', '<leader>tp', ':tabp<CR>') --  go to previous tab

-- bufferline clear all buffers except this one
keymap.set('n', '<leader>xx', ':%bd|e#<CR>')
----------------------
-- Plugin Keybinds
----------------------

-- nvimtree
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>') -- toggle file explorer

-- telescope
keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>') -- find files within current working directory, respects .gitignore
keymap.set('n', '<leader>fs', '<cmd>Telescope live_grep<cr>') -- find string in current working directory as you type
keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>') -- find string under cursor in current working directory
keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>') -- list open buffers in current neovim instance
keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>') -- list available help tags

-- telescope git commands (not on youtube nvim video)
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set('n', '<leader>rs', ':LspRestart<CR>') -- mapping to restart lsp if necessary

-- save and quit
keymap.set('n', '<leader>ss', ':w!<CR>')
keymap.set('n', '<leader>sf', ':noa w!<CR>')
keymap.set('n', '<leader>sa', ':wa!<CR>')
keymap.set('n', '<leader>sfa', ':noa wa!<CR>')
keymap.set('n', '<leader>q', ':q<CR>')

-- bufferline tab close
keymap.set('n', '<leader>tx', ':bdelete!<CR>')

-- lazygit keybind
keymap.set('n', '<leader>gg', ':LazyGit<CR>')

-- keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>') -- see available code actions
-- keymap.set('n', '<leader>tt', '<cmd>Lspsaga term_toggle<CR>')
keymap.set('n', '<leader>gf', ':Telescope lsp_references show_line=false<CR>')
keymap.set('n', '<leader>gt', '<cmd>Lspsaga peek_type_definition<CR>')

-- keymap.set('n', '<leader>po', "<cmd>lua require('rest-nvim').run()<CR>") -- see available code actions

-- harpoon
local harpoon = require 'harpoon'
keymap.set('n', '<leader>ha', function()
  harpoon:list():add()
end)
keymap.set('n', '<leader>hh', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '<leader>j', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<leader>k', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<leader>l', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<leader>;', function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- lsp
keymap.set('n', '<leader>ge', '<cmd>lua vim.diagnostic.open_float()<CR>') -- show  diagnostics for line

-- gitsigns
keymap.set('n', 'gj', '<cmd>Gitsigns next_hunk<CR>') -- show  diagnostics for line
keymap.set('n', 'gk', '<cmd>Gitsigns prev_hunk<CR>') -- show  diagnostics for line

-- scissors
vim.keymap.set('n', '<leader>se', function()
  require('scissors').editSnippet()
end)

-- When used in visual mode prefills the selection as body.
vim.keymap.set({ 'n', 'x' }, '<leader>sn', function()
  require('scissors').addNewSnippet()
end)

-- toggle wrap
keymap.set('n', '<leader>w', ':set wrap!<CR>') -- show  diagnostics for line

-- toggle blame
keymap.set('n', '<leader>tb', ':BlameToggle<CR>') -- show  diagnostics for line

-- insert date
keymap.set('n', '<leader>id', ":pu=strftime('%m/%d/%y')<CR>") -- show  diagnostics for line

-- lsp
-- keymap.set("n", "<leader>li", ":LspInfo<CR>") -- show  diagnostics for line
-- keymap.set("n", "<leader>lr", ":LspRestart<CR>") -- show  diagnostics for line

-- testing

keymap.set('n', '<leader>tf', ':lua require(\'neotest\').run.run(vim.fn.expand("%"))<CR>') -- run tests for file
keymap.set('n', '<leader>tt', ":lua require('neotest').run.run()<CR>") -- run tests for file
keymap.set('n', '<leader>tr', ":lua require('neotest').output_panel.open()<CR>") -- run tests for file

-- Type peaking
keymap.set('n', '<leader>ty', ':lua vim.lsp.buf.hover()<CR>') -- peak at type

-- quickfix errors
keymap.set('n', '<leader>fe', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>eq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- filepath
keymap.set('n', '<leader>p', ':lua print(vim.api.nvim_buf_get_name(0))<CR>')
