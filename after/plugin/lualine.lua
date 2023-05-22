-- @ github/al-ce/nvim
local function loaded_buffer_count()
    local is_loaded = vim.api.nvim_buf_is_loaded
    local tbl = vim.api.nvim_list_bufs()
    local loaded_bufs = 0
    for i = 1, #tbl do
        if is_loaded(tbl[i]) then
            loaded_bufs = loaded_bufs + 1
        end
    end
    return loaded_bufs
end

-- vim.keymap.set("n", "<leader>bD", "<cmd>%bd|e#<CR>",{ desc = "Close all buffers except current" })
local function close_all_buffers_except_current()
    vim.cmd("%bd|e#")
end

-- Set lualine as statusline
require('lualine').setup({
    -- See `:help lualine.txt`
    options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
        --theme = 'onedark',
        --fmt = string.lower, -- upper | lower
    },
    sections = {
        lualine_a = {
            -- use_mode_colors = false,
            { 'mode', fmt = function(str) return str:sub(1, 1) end }, -- First char only.
            --{ 'datetime', style = 'default' },                                     -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
        },
        lualine_c = {
            -- { 'filename', },
            {
                loaded_buffer_count,                     -- Display number of loaded buffers.
                color = { fg = "violet", gui = "bold" }, --color = nil,
                icon = "buf",
                icons_enabled = true,
                on_click = function()
                    print("closing all buffers except current?")
                    close_all_buffers_except_current()
                end,
            },
            { 'buffers', max_length = vim.o.columns * 2 / 3, mode = 2 },          -- hide_filename_extension = false, show_modified_status = true,
        },
    }
})


-- Lualine has sections as shown below.
--
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+
-- Each sections holds its components e.g. Vim's current mode.
