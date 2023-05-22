require('rose-pine').setup({
    disable_background = true
})

-- 1. Sets color scheme
-- 2. Sets transparant background.
--
-- vim.opt.background = 'dark' vim.opt.termguicolors = true
function ColorMyPencils(color)
    color = color or "rose-pine-moon" -- fallback to default `rose-pine` if no `color`.
    vim.cmd.colorscheme(color)        -- Sets colorscheme.

    -- `0` sets global space for every window. `Normal` is for vim.
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })         -- Sets transparency for background.
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })    -- Sets transparency for background floats too.
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#111111" }) -- Sets color for ColorColumn at 80 width. see lua/gg/sets.lua.
end

ColorMyPencils() -- Run `:lua ColorMyPencils()` from anywhere in neovim cmd.
