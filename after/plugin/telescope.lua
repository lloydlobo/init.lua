-- [Source](https://github.com/nvim-telescope/telescope.nvim#usage)
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})      -- <normal> -> `<leader>+p+f` -> `:Telescope find_files` (find project files).
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})       -- <normal> -> `<leader>+g+f` -> `:Telescope git_files` (git files search).
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") }); -- grep_string (provides search term which is an vim function input.
end)                                                           -- <normal> -> `<leader>+p+s` -> `:Telescope grep_string` (Grep search term project).
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
