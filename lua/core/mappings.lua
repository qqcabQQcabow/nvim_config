vim.g.mapleader = " "

--Neo Tree
vim.keymap.set('n', '<leader>e', ':Neotree float focus<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')

-- Docs view
vim.keymap.set('n', '<leader>k', ':DocsViewToggle<CR>')

-- Error view
vim.keymap.set('n', '<leader>w', ':Trouble diagnostics toggle focus=false<CR>')
--vim.keymap.set('n', '<leader>r', ':lua vim.diagnostic.open_float{}<CR>')

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
