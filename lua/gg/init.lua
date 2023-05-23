-- TODO: require("gg.set")
require("gg.remap")
require("gg.set") -- Adds sets to make editor experience better. e.g. automatic linenumbers etc.

-- print("hello from gg") -- debug.

local augroup = vim.api.nvim_create_augroup
local gg_group = augroup('Gg', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end
})

autocmd({ "BufWritePre" }, {
    group = gg_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- NOTE: Where should I put you?
-- Esc twice to get to normal mode
vim.cmd([[tnoremap <esc><esc> <C-\><C-N>]])

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
