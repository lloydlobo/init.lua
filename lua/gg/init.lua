-- TODO: require("gg.set")
require("gg.remap")

print("hello from gg")

local augroup = vim.api.nvim_create_augroup
local GgGroup = augroup('Gg',{})
