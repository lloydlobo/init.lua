vim.opt.guicursor = "" -- Fat cursor also for insert mode.

-- OR use -- if true then   end

local show_numbers = false             -- NOTE: toggle this to show numbers.
vim.opt.nu = show_numbers             -- Set numbers in gutter.
vim.opt.relativenumber = show_numbers -- Use relative numbers in gutter.

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 -- Tabs to 4 spaces.
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false                                 -- So you can use `undotree` plugin instead.
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Long running undos for days.
vim.opt.undofile = true

vim.opt.hlsearch = false      -- Removes highlighting after searching a keyword.
vim.opt.incsearch = true      -- Guides highlighting while you type.

vim.opt.termguicolors = true  -- NOTE: DUPLICATE in /after/colors.lua.

vim.opt.scrolloff = 8         -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@") -- The characters specified by this option are included in file names and
--                            --   path names.  Filenames are used for commands like "gf", "[i" and in
--                            --   the tags file.  It is also used for "\f" in a |pattern|.
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80" -- 'colorcolumn' is a comma-separated list of screen columns that are
--                         -- highlighted with ColorColumn |hl-ColorColumn|.  Useful to align
--                         -- text.  Will make screen redrawing slower.

vim.g.mapleader = " " -- NOTE: DUPLICATE in lua/../remap.lua.
