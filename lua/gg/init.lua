-- TODO: require("gg.set")
require("gg.remap")
require("gg.set") -- Adds sets to make editor experience better. e.g. automatic linenumbers etc.

-- print("hello from gg") -- debug.

local augroup = vim.api.nvim_create_augroup
local GgGroup = augroup('Gg',{})

