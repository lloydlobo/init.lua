-- 
-- LEADER KEY
--
vim.g.mapleader = " " -- (Space as Leader Key)

--
-- LEADER KEYBINDINGS
--

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- <normal> -> `<leader>+p+v` -> `:Ex` (Project view -> Opens Netrw Explorer)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Select and move line below.
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- Select and move line above.

-- [0 to LSP] 25:25 minute mark
--
-- :%s\/(./)noremap(/vim.keymap.set("\1",
-- :%s -- do it for entire file.
-- /\(.\) -- everything that has a `.` (dot). Looks like a fighting one-eyed curvy. e.g. vnoremap("J"...
-- <word_to_replace> -- do not use `<`/`>` while entering the word.
-- (/<word_to_replace_with>"\1 -- suffix with `"` and the first letter (dot) char we skipped earlier. so `"v` e.g. vim.keymap.set("v"...
