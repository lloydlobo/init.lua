-- [Source](https://github.com/nvim-telescope/telescope.nvim#usage)

local builtin = require('telescope.builtin');
local themes = require('telescope.themes');

vim.keymap.set('n', '<leader>pf', builtin.find_files,
    -- <normal> -> `<leader>+p+f` -> `:Telescope find_files` (find project files).
    { desc = 'Find [p]roject [f]iles' });
vim.keymap.set('n', '<leader>gf', builtin.git_files,
    -- <normal> -> `<leader>+g+f` -> `:Telescope git_files` (git files search).
    { desc = 'Find [g]it [files]' });
vim.keymap.set('n', '<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end,
    -- grep_string (provides search term which is an vim function input.
    -- See :Telescope grep_string` (Grep search term project).
    { desc = 'Grep [p]roject [s]earch terms' });
vim.keymap.set('n', '<leader>/',
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    function() builtin.current_buffer_fuzzy_find(themes.get_dropdown { winblend = 10, previewer = false, }) end,
    { desc = '[/] Fuzzily search in current buffer' });
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = 'Show [v]im [h]elp_tags' });
vim.keymap.set('n', '<leader>k', builtin.keymaps, { desc = 'Open [k] Command Pallete' });
