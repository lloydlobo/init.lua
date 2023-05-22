-- [Source](https://github.com/nvim-telescope/telescope.nvim#usage)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- <normal> mode -> `<leader>+p+f` -> `:Telescope find_files` (find project files)
